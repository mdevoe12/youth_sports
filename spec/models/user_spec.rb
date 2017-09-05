require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should have_many(:user_roles) }
  it { should have_many(:roles).through(:user_roles) }
end
