class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # # GET /users/1
  # # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit

  end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def player 
    @users = User.order("points DESC")
  end

  def tournament
    @jeux_videos = JeuxVideo.order("users_count DESC")
    @tournois = Tournoi.order("users_count DESC")
  end

  def statistiques
    @users = User.order("points DESC")
    @jeux_videos = JeuxVideo.order("users_count DESC")
    @tournois = Tournoi.order("users_count DESC")
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @user.initialize_users(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:admin, :user_name, :email, :password, :password_confirmation, :pseudo, :age, :sexe, :pays, :description, :tournoi_id, :points, :win, :tie, :loose, :latitude, :longitude, :current_sign_in_ip, :ville, :adresse)
    end

end  




