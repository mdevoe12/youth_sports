require 'rails_helper'

RSpec.describe Recruiter, type: :model do

  describe "associations" do
    it { should have_one(:profile) }
    it { should have_many(:prospects), through: :profile}
  end

  describe ".name" do
    it "returns the full name for a recruiter" do
      recruiter = create(:recruiter, :with_profile)

      expect(recruiter.name).to eq("#{recruiter.profile.first_name}" + " " "#{recruiter.profile.last_name}")
    end
  end
end
