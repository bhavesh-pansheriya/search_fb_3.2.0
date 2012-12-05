class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid

  has_many :user_accepteds, :dependent => :destroy

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(:provider => auth.provider, :uid => auth.uid, :email => auth.info.email, :password => Devise.friendly_token[0,20])
    end
    user
  end
  
end
