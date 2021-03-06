class TournoisController < ApplicationController
  before_action :set_tournoi, only: [:show, :edit, :update, :destroy]

  # GET /tournois
  # GET /tournois.json
  def index
    @tournois = Tournoi.all
  end

  # GET /tournois/1
  # GET /tournois/1.json
  def show
    @tournois = Tournoi.find(params[:id])
  end

  # GET /tournois/new
  def new
    @tournoi = Tournoi.new
  end

  # GET /tournois/1/edit
  def edit
  end

  # POST /tournois
  # POST /tournois.json
  def create
    @tournoi = Tournoi.new(tournoi_params)
    @tournoi.initialize_tournois(@tournoi)

    respond_to do |format|
      if @tournoi.save
        @tournoi.create_activity :create, owner: current_user, read: false
        format.html { redirect_to @tournoi, notice: 'Tournoi was successfully created.' }
        format.json { render :show, status: :created, location: @tournoi }
        format.js   { flash[:notice] = "Tournoi was successfully created." }
      else
        format.html { render :new }
        format.json { render json: @tournoi.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tournois/1
  # PATCH/PUT /tournois/1.json
  def update
    respond_to do |format|
      if @tournoi.update(tournoi_params)
        @tournoi.create_activity :update, owner: current_user, read: false
        format.html { redirect_to @tournoi, notice: 'Tournoi was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournoi }
      else
        format.html { render :edit }
        format.json { render json: @tournoi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournois/1
  # DELETE /tournois/1.json
  def destroy
    @tournoi.create_activity :destroy, owner: current_user, read: false
    @tournoi.destroy
    respond_to do |format|
      format.html { redirect_to tournois_url, notice: 'Tournoi was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def list
    @tournoi = Tournoi.find(params[:id])
  end

  def add_user
    @tournoi = Tournoi.find(params[:id])
    @tournoi.users << current_user
    @tournoi.save
    @user = current_user
    UserMailer.inscription(@user, @tournoi).deliver_later
    redirect_to list_tournois_path
  end

  def play  
    @tournoi = Tournoi.find(params[:id])
    @tournoi.initialize_matches
    @tournoi.matches.each do |match|
      match.versus
      match.points
    end
    @user = current_user
    UserMailer.points(@user, @tournoi).deliver_later
    @tournoi.create_activity :play, owner: current_user, read: false
    redirect_to matches_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournoi
      @tournoi = Tournoi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournoi_params
      params.require(:tournoi).permit(:title, :pays, :lieu, :latitude, :longitude, :date, :heure_inscription, :regles, :jeux_proposés, :nb_joueurs_max, :recompenses, :niveau_de_jeu) 
         end
end
