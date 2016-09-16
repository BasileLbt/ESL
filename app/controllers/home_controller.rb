class HomeController < ApplicationController
	skip_before_action :authenticate_user!
	def index
    @jeux_videos = JeuxVideo.all
	end
end
