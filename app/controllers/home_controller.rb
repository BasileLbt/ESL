class HomeController < ApplicationController
	def index
    @jeux_videos = JeuxVideo.all
	end
end
