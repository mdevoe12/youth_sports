require 'rails_helper'

describe "logged in athlete" do
  scenario "can visit their profile page" do
    # As an authenticated player
    aj = Player.create(first_name: 'AJ',
                            last_name: 'Randall',
                            username: 'aj',
                            password: 'password')
    aj_profile = PlayerProfile.create(school: 'Hamilton Middle School',
                                    height: '4ft10',
                                    weight: '90',
                                    grade_level: 6,
                                    gpa: 4.0,
                                    guardian_phone: '7202436470',
                                    player_id: aj.id)
    # When I login
    # current_user = allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(aj)
    # click_on 'dropdown'
    # I should be routed to my dashboard
    # click_on "Sign In"
    visit 'login'

    within ".col-md-offset-3" do
      fill_in "Username", with: "aj"
      fill_in "Password", with: "password"
      click_on "Log in"
    end
    # visit '/dashboard'
    expect(current_path).to eq('/dashboard')
    # And when I click on View Profile
    # expect(page).to have_link("Log In")
    # expect(page).to have_link("Edit Profile")
    expect(page).to have_content('Hamilton Middle School')
    expect(page).to have_content('4ft10')
    expect(page).to have_content("90")
    expect(page).to have_content("6")
    expect(page).to have_content('7202436470')
    # expect(current_path).to eq(edit_player_profile_path)
    # # And I click on Edit Profile
    click_on "Edit Profile"
    # # I should be able to modify everything (except my own stats, gpa), show date modified
    # expect(page).to have_content("last updated at: #{aj.player_profile.updated_at}")
    # expect(page).to have_content("last updated at: #{aj.player_profile.updated_at}")
    # # I should be redirected to my dashboard page
    expect(current_path).to eq("/player_profiles/#{aj.id}/edit")
    # And I should see my new information

    expect(page).to have_content("Edit Profile")
    # expect(page).to have_content()
    fill_in "School", with: "none"
    fill_in "Height", with: "10"
    fill_in "Weight", with: "1000"
    fill_in "Grade level", with: "1"
    fill_in "Guardian phone", with: "2222222222"
    click_on "Update Player profile"

    expect(current_path).to eq("/dashboard")
    # save_and_open_page
    expect(page).to have_content("none")
    expect(page).to have_content("10")
    expect(page).to have_content("1000")
    expect(page).to have_content("1")
    expect(page).to have_content("2222222222")

  end
end
