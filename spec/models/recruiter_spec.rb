require 'rails_helper'

RSpec.describe Recruiter, type: :model do
  it { should have_one(:profile) }
  it { should have_many(:prospects), through: :profile}
end
