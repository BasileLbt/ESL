class Tournoi < ActiveRecord::Base
	geocoded_by :lieu
	after_validation :geocode
	belongs_to :user
	has_many :users
	has_many :matches
	has_many :jeux_videos
	validates :users_id, presence: true
end
