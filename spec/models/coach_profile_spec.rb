require 'rails_helper'

RSpec.describe CoachProfile, type: :model do
  it { should belong_to(:coach) }
end
