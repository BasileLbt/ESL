class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  geocoded_by :full_street_adresse
  after_validation :geocode
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :confirmable, :trackable, :omniauth_providers => [:facebook]
  has_and_belongs_to_many :tournois
  has_and_belongs_to_many :jeux_videos
  has_and_belongs_to_many :favorites
  has_and_belongs_to_many :matches 
  validates :email, uniqueness: true
  

  def full_street_adresse
    [adresse, ville, pays].compact.join(', ')
  end

  def initialize_users(user)
    user.points = 0
    user.win = 0
    user.tie = 0 
    user.loose = 0
  end

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


  

end