class JeuxVideo < ActiveRecord::Base
	has_many :users
	belongs_to :user
	has_many :tournois
	belongs_to :tournoi
end
