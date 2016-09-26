class Match < ActiveRecord::Base
	belongs_to :tournoi
	has_many :users
end

