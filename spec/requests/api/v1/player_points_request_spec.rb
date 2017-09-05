require 'rails_helper'

describe 'players api points endpoint' do
  before(:each) do
    
  end
  it 'returns a list of points within a date-range' do
    visit('/api/v1/players/1/stats')
  end
end
