module API
	class TournoisController < ApplicationController 
		skip_before_filter :authenticate_user!

		def index 
			tournois = Tournoi.all
			render json: tournois, status: 200
		end 
	end
end
