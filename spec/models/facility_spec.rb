require 'rails_helper'

RSpec.describe Facility, type: :model do
  it { should have_many(:games) }
end
