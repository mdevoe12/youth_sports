require 'rails_helper'

RSpec.describe RecruiterProfile, type: :model do
  it { should belong_to(:recruiter) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:institution) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
end
