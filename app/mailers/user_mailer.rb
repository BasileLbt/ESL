class UserMailer < ApplicationMailer
	default :from => "basilelabat@gmail.com"

	def inscription(user, tournoi)
		@user = user 
		@tournoi = tournoi
		mail(to: user.email, subject: "Thanks for apply a tournament")
	end

	def points(user, tournoi)
		@user = user
		@tournoi = tournoi 
		mail(to: user.email, subject: "You won some points")
	end
end
