class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :confirmable, :trackable, :omniauth_providers => [:facebook]
  has_and_belongs_to_many :tournois
  has_and_belongs_to_many :jeux_videos
  has_and_belongs_to_many :matches, :through => :tournois
  validates :email, uniqueness: true
  

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


	def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  		end
	end


  def points
    @user.matches.each do |match|
      if (match.score_player1 = 3 and match.score_player2 = 0 )
        player1_points += 3
        player1_win += 1
        player2_loose +=1
      elsif (match.score_player1 = 1 and match.score_player2 = 1)
        player1_points += 1
        player1_tie += 1 
        player2_tie +=1
      elsif (match.score_player1 = 0 and match.score_player2 = 3)
        player2_points += 3
        player2_win += 1
        player1_loose += 1
      end
    end
  end

end