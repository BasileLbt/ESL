class FavoritesController < ApplicationController

	def add_jv_fav_to_user
		
    	@favorite = Favorite.find(params[:id])
    	@jeux_video = JeuxVideo.find(params[:id])
    	@favorite.title = @jeux_video.title
    	@favorite.save
    	@favorite.users << current_user
    	redirect_to @jeux_video, notice: 'Favorite Jeux video was successfully added.'
  	end
	

  private

    def favorite_params
      params.require(:favorite).permit(:title)
    end
end

