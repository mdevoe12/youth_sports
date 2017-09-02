require 'rails_helper'

RSpec.describe RecruiterProfile, type: :model do
  it { should belong_to(:recruiter) }
end
