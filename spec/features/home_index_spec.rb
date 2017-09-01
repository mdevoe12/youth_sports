require 'rails_helper'

describe "#home index" do
  it "goes to the home page" do
    visit "/"
    # expect(current_path).to eq(home)
    expect(page).to have_content("Login")
    expect(page).to have_content("Sign up")

  end

  xit "can see buttons to log in with Oauth" do
    visit "/"
    expect(page).to have_link("Sign up with Facebook")
    expect(page).to have_content("Sign up with Google")
  end
end
