require 'rails_helper'

RSpec.describe RecruiterProfile, type: :model do
  it { should belong_to(:recruiter) }
  it { should have_many(:prospects)}
end
