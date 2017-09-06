require 'rails_helper'

RSpec.describe AdminProfile, type: :model do
  it { should belong_to(:admin) }
end
