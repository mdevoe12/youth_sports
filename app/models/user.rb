class User < ApplicationRecord

  devise :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy

  self.inheritance_column = :type

  def email_required?
    false
  end

  def self.create_from_omniauth(params)
    attributes = {
      first_name: params.info.name.split[0],
      last_name: params.info.name.split[-1],
      username: params.info.name.split.join.downcase,
      email: params['info']['email'],
      password: Devise.friendly_token
    }
    create!(attributes)
  end

  def self.types
    %w(Coach Player Recruiter Admin)
  end
end
