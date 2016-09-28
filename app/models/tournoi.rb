class Tournoi < ActiveRecord::Base
	geocoded_by :lieu
	after_validation :geocode
	has_and_belongs_to_many :users
	has_many :matches
	has_and_belongs_to_many :jeux_videos
	
end
