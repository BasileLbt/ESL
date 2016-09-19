class Tournoi < ActiveRecord::Base
	geocoded_by :lieu
	after_validation :geocode
	has_many :users
	has_many :matches

end
