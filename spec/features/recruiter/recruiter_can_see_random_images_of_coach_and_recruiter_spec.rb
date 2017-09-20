require "rails_helper"

feature "Recruiter can see random images of recruiters and coaches" do

  before(:each) do
     @recruiter         = create(:recruiter, :with_profile)
     @coach             = create(:coach, :with_profile)
     @player = create(:player, :with_profile)
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@recruiter)
   end
   scenario "when they visit the coach or recruiter show page" do
    visit recruiter_profile_path(@recruiter.profile.id)

    expect(current_path).to eq("/recruiter_profiles/#{@recruiter.profile.id}")

    expect(page).to have_css(".image")
  end
end
