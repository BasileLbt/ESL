module API
	class UsersController < ApplicationController 
		skip_before_filter :authenticate_user!

		def show 
			user = User.find(params[:id])
			render json: user, status: 200
		end 
	end
end
