require 'rails_helper'

RSpec.describe Prospect, type: :model do
  it { should belong_to(:recruiter_profile) }
  it { should belong_to(:player_profile) }
end
