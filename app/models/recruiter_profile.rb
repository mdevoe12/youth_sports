class RecruiterProfile < ApplicationRecord
  belongs_to :recruiter
  validates_presence_of :username, :institution, :email, :phone_number
  validates_uniqueness_of :username, :email
end
