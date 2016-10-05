class Tournoi < ActiveRecord::Base
	geocoded_by :lieu
	after_validation :geocode
	has_and_belongs_to_many :users
	has_many :matches
	belongs_to :jeux_videos
	
	def initialize_matches
		a = self.users
		a.combination(2).to_a
		b = a.combination(2).to_a.count - 1 
		for i in 0..b
			Match.new
			match.tournoi_id = tournoi_id
			match.player1 = a.combination(2).to_a[i].first
			match.player2 = a.combination(2).to_a[i].second
		end	
	end
end	