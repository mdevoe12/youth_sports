class User < ApplicationRecord
  has_secure_password
  has_many :user_roles
  has_many :roles, through: :user_roles


def twitter_resp
  @twi_resp = request.env['omniauth.auth']
end

  self.inheritance_column = :type

  def self.types
    %w(Coach Player Recruiter Admin)
  end
end
