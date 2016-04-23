class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  validates :name, presence: true
  validates :email, presence: true, uniqueness:true

  has_many :monsters
  has_many :monster_teams

  def self.from_omniauth(params)
    user          = User.find_or_initialize_by(provider: params[:provider], uid: params[:uid], email: params.info.email, name: params.info.name)
    user.password = Devise.friendly_token
    user.save
    user
  end
end
