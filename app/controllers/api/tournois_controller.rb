module API
	class TournoisController < ApplicationController 
		def index 
			tournois = Tournoi.all
			render json: tournois, status: 200
		end 
	end
end
