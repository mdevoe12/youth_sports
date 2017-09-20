require 'rails_helper'

RSpec.describe "Recruiter visits a player's profile and" do
  scenario "sees a flame icon on that page if the player is being recruited by more than 3 recruiters" do
    recruiter = create(:recruiter, :with_profile)
    players = create_list(:player, 3, :with_profile, :with_team)
    hot_players = create_list(:player, 3, :with_profile, :with_team)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)
  end
end
