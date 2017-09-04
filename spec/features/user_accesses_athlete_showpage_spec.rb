require 'rails_helper'

RSpec.feature 'user visits athlete showpage' do
  describe 'their own dashboard' do
    it 'sees individualized data with welcome' do
      @athlete = create(:user, :complete, type: "Player")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@athlete)
    end
  end
  describe 'someone elses dashboard' do
    it 'sees generic data and no welcome' do
      @athlete = create(:user, :complete, type: "Player")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@athlete)
    end
  end
end
