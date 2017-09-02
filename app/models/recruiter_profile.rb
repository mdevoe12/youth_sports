class RecruiterProfile < ApplicationRecord
  belongs_to :recruiter
  has_many :prospects
  validates_presence_of :username, :institution, :email, :phone_number
  validates_uniqueness_of :username, :email
end
