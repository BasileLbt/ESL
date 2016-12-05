module API
	class UsersController < ApplicationController 
		skip_before_filter :authenticate_user!
		before_filter :restrict_access

		def show 
			user = User.find(params[:id])
			render json: user, status: 200
		end 

		private 
		def restrict_access
			api_key = APIKey.find_by_access_token(params[:access_token])
			head :unauthorized unless api_key
		end
	end
end
