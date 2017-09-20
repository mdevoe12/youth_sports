require 'rails_helper'

RSpec.describe RecruiterProfile, type: :model do
  it { should belong_to(:recruiter) }
  it { should have_many(:prospects) }
  it { should have_many(:player_profiles).through(:prospects)}
end
