class Favorite < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :jeux_videos
	validates :title, uniqueness: true
end
