class Match < ActiveRecord::Base
	belongs_to :tournoi
	belongs_to :player1, :class_name => '::User'
	belongs_to :player2, :class_name => '::User'
	has_and_belongs_to_many :users

	def versus 
    a = rand (1..3)
      if (a == 3)
       score_player1 = 3
       score_player2 = 0  
      elsif (a == 2) 
       score_player1 = 1
       score_player2 = 1 
      elsif (a == 1) 
       score_player1 = 0
       score_player2 = 3 
      end
      Match.update(score_player1, score_player2)
  end

end