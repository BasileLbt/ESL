class JeuxVideosController < ApplicationController
  before_action :set_jeux_video, only: [:show, :edit, :update, :destroy]

  # GET /jeux_videos
  # GET /jeux_videos.json
  def index
    @jeux_videos = JeuxVideo.all
  end

  # GET /jeux_videos/1
  # GET /jeux_videos/1.json
  def show
    @jeux_videos = JeuxVideo.find(params[:id])
    
  end

  # GET /jeux_videos/new
  def new
    @jeux_video = JeuxVideo.new
  end

  # GET /jeux_videos/1/edit
  def edit
  end

  # POST /jeux_videos
  # POST /jeux_videos.json
  def create
    @jeux_video = JeuxVideo.new(jeux_video_params)
    @jeux_video.initialize_jeuxvideo(@jeux_video)
    @jeux_video.save
    @favorite = Favorite.new
    @favorite.save  

    respond_to do |format|
      if @jeux_video.save
        @jeux_video.create_activity :create, owner: current_user, read: false
        format.html { redirect_to @jeux_video, notice: 'Jeux video was successfully created.' }
        format.json { render :show, status: :created, location: @jeux_video }
        format.js   
      else
        format.html { render :new }
        format.json { render json: @jeux_video.errors, status: :unprocessable_entity }
        format.js   
      end
    end
  end

  # PATCH/PUT /jeux_videos/1
  # PATCH/PUT /jeux_videos/1.json
  def update
    respond_to do |format|
      if @jeux_video.update(jeux_video_params)
        @jeux_video.create_activity :update, owner: current_user, read: false
        format.html { redirect_to @jeux_video, notice: 'Jeux video was successfully updated.' }
        format.json { render :show, status: :ok, location: @jeux_video }
      else
        format.html { render :edit }
        format.json { render json: @jeux_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jeux_videos/1
  # DELETE /jeux_videos/1.json
  def destroy
    @jeux_video.create_activity :destroy, owner: current_user, read: false
    @jeux_video.destroy
    respond_to do |format|
      format.html { redirect_to jeux_videos_url, notice: 'Jeux video was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def add_jv_to_user
    @jeux_video = JeuxVideo.find(params[:id])
    @jeux_video.users << current_user 
    @jeux_video.save
    redirect_to @jeux_video, notice: 'Jeux video was successfully added.' 
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jeux_video
      @jeux_video = JeuxVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jeux_video_params
      params.require(:jeux_video).permit(:title, :body, :commentaire, :nb_joueur, :server, :champion)
       end
end
