class Match < ActiveRecord::Base
	belongs_to :tournoi, :through => :users
end

