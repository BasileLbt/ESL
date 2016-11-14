class Tournoi < ActiveRecord::Base
	geocoded_by :lieu
	after_validation :geocode
	has_and_belongs_to_many :users
	has_many :matches
	belongs_to :jeux_videos
	validates :title, :presence => true, :length => { :minimum => 5 }
	validates :pays, :presence => true, :length => { :maximum => 10 }
	validates :lieu, :presence => true, :length => { :minimum => 15 }
	validates :regles, :presence => true, :length => { :minimum => 10, :maximum => 100 }
	validates :recompenses, :presence => true, :length => { :minimum => 10, :maximum => 50 }
	
	def initialize_matches
		a = self.users
		b = a.combination(2).to_a.count - 1 
		for i in 0..b
			match = Match.new
			match.tournoi_id = self.id
			match.player1 = a.combination(2).to_a[i].first
			match.player2 = a.combination(2).to_a[i].second 
			match.save
		end	
	end

	def initialize_tournois(tournoi)
    	tournoi.users_count = 0
  	end

  	def add_user_count(tournoi)
  		tournoi.users_count += 1
  	end

end	