require 'rails_helper'

 describe "logged in athlete" do
   scenario "can visit their profile page" do
     # As an authenticated player
     aj = Player.create(first_name: 'AJ',
                             last_name: 'Randall',
                             username: 'aj',
                             email: 'aj@aj.com',
                             password: 'password')
     aj_profile = PlayerProfile.create(school: 'Hamilton Middle School',
                                     height: '4ft10',
                                     weight: '90',
                                     grade_level: 6,
                                     gpa: 4.0,
                                     guardian_phone: '7202436470',
                                     player_id: aj.id)

     visit 'login'

       fill_in "session[email]", with: "aj@aj.com"
       fill_in "session[password]", with: "password"
       click_on "Log in"

     expect(current_path).to eq('/dashboard')
     expect(page).to have_content('Hamilton Middle School')
     expect(page).to have_content('4ft10')
     expect(page).to have_content("90")
     expect(page).to have_content("6")
     expect(page).to have_content('7202436470')
     click_on "Edit Profile"

     expect(current_path).to eq("/player_profiles/#{aj.id}/edit")

     expect(page).to have_content("Edit Profile")
     fill_in "School", with: "none"
     fill_in "Height", with: "10"
     fill_in "Weight", with: "1000"
     fill_in "Grade level", with: "1"
     fill_in "Guardian phone", with: "2222222222"
     click_on "Update Player profile"

     expect(current_path).to eq("/dashboard")
     expect(page).to have_content("none")
     expect(page).to have_content("10")
     expect(page).to have_content("1000")
     expect(page).to have_content("1")
     expect(page).to have_content("2222222222")

   end
 end
