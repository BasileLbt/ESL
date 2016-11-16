class JeuxVideo < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	has_and_belongs_to_many :users
	has_many :tournois
	has_many :comments
	validates :title, :presence => true, :length => { :minimum => 5 }
	validates :body, :presence => true, :length => { :minimum => 5, :maximum => 30 }
	validates :commentaire, :presence => true, :length => { :minimum => 5, :maximum => 30 }
	validates :nb_joueur, :presence => true
	validates :server, :presence => true, :length => { :maximum => 10 }
	validates :champion, :presence => true, :length => { :maximum => 10 }

	def initialize_jeuxvideo(jeux_video)
    	jeux_video.users_count = 0
  	end

end
