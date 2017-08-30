class User < ApplicationRecord

  self.inheritance_column = :type

  def self.types
    %w(Coach Player Recruiter Admin)
  end
end
