require "rails_helper"

feature "User can see random images of recruiters and coaches" do

  before(:each) do
     @recruiter         = create(:recruiter, :with_profile)
     @coach             = create(:coach, :with_profile)
     @player = create(:player, :with_profile)
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@player)
   end
   scenario "when they visit the coach or recruiter show page" do

    visit recruiter_profile_path(@recruiter_profile.id)

    expect(current_path).to eq("/recruiter_profile/#{@recruiter_profile.id}")

    expect(@images.sample.picture).to eq(1)
    expect(@images).to be_a String

    expect(page).to have_css(".image")
  end
end
