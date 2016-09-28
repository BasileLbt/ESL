class Match < ActiveRecord::Base
	belongs_to :tournoi
	has_and_belongs_to_many :users
end

	