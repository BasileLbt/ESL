class TournoisController < ApplicationController
  before_action :set_tournoi, only: [:show, :edit, :update, :destroy, :list]

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

    respond_to do |format|
      if @tournoi.save
        format.html { redirect_to @tournoi, notice: 'Tournoi was successfully created.' }
        format.json { render :show, status: :created, location: @tournoi }
      else
        format.html { render :new }
        format.json { render json: @tournoi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournois/1
  # PATCH/PUT /tournois/1.json
  def update
    respond_to do |format|
      if @tournoi.update(tournoi_params)
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
    @tournoi.destroy
    respond_to do |format|
      format.html { redirect_to tournois_url, notice: 'Tournoi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list
    @tournoi = Tournoi.find(params[:id])
  end

  def add_user
    @current_user.save
    redirect_to @list , notice: 'Vous êtes bien inscrit au tournoi'
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
