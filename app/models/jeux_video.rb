class JeuxVideo < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :tournois
	validates :title, :presence => true, :length => { :minimum => 5 }
	validates :body, :presence => true, :length => { :minimum => 5, :maximum => 30 }
	validates :comments, :presence => true, :length => { :minimum => 5, :maximum => 30 }
	validates :nb_joueur, :presence => true, :format => { :with => /\A(\+1)?[0-9]{10}\z/, :message => "is not a number" }
	validates :server, :presence => true, :length => { :maximum => 10 }
	validates :champion, :presence => true, :length => { :maximum => 10 }
end
