class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include UserOath

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github, :facebook, :google_oauth2]

  has_many :authorizations
  validates :email, presence: true
  validates :password, presence: true

  def self.create_from_omniauth(params)
    self.send(params.provider,params)
  end
end
