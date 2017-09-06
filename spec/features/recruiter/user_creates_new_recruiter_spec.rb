require 'rails_helper'

RSpec.describe 'A new user clicks "Sign Up as a Reruiter" from the home page' do
  scenario 'and can sees a form to sign up for an account' do
    VCR.use_cassette('features/new_recruiter', record: :new_episodes) do
      visit '/'
      click_on 'Sign Up as a Reruiter'
      



    end
  end
end
