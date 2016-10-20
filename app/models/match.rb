class Match < ActiveRecord::Base
	belongs_to :tournoi
	belongs_to :player1, :class_name => "User"
	belongs_to :player2, :class_name => "User"
	has_and_belongs_to_many :users

	def versus 
    a = rand (1..3)
      if (a == 3)
       self.score_player1 = 3
       self.score_player2 = 0  
       self.winner_id = self.player1_id
      elsif (a == 2) 
       self.score_player1 = 1
       self.score_player2 = 1 
       self.winner_id = 0
      elsif (a == 1) 
       self.score_player1 = 0
       self.score_player2 = 3 
       self.winner_id = self.player2_id
      end
      self.save
  end

  def points 
      if (self.score_player1 == 3)
        player1.points += 3 
        player1.win += 1 
        player2.loose += 1
      elsif (self.score_player1 == 1)
        player1.points += 1
        player2.points += 1
        player1.tie += 1
        player2.tie += 1
      elsif (self.score_player1 == 0)
        player2.points += 3 
        player2.win += 1
        player1.loose += 1
      end
      player2.save
      player1.save
  end
        
end