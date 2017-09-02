class RecruiterProfile < ApplicationRecord
  belongs_to :recruiter
  has_many :prospects
end
