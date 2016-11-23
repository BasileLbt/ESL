class FavoritesController < ApplicationController

	def index 
		@favorites = Favorite.all 
	end

	def show
    	@favorites = Favorite.find(params[:id])
  	end

	def add_jv_fav_to_user
		
		@favorite = Favorite.new
    	@favorite.users << current_user
    	@jeux_video = JeuxVideo.find(params[:id])
    	@favorite.jeux_videos << @jeux_video
    	@favorite.title = @jeux_video.title
    	@favorite.save
    	redirect_to @jeux_video, notice: 'Favorite Jeux video was successfully added.'
  	end
	

  private

    def favorite_params
      params.require(:favorite).permit(:title)
    end
end

