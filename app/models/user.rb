class User < ApplicationRecord

  has_many :user_roles
  has_many :roles, through: :user_roles

  self.inheritance_column = :type

  def self.types
    %w(Coach Player Recruiter Admin)
  end
end
