class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :jeux_video
end
