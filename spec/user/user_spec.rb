# require 'rails_helper'
#
# describe User do
#
#   describe '#player' do
#     it { should validate_presence_of(:grade_level) }
#     it { should_not allow_value("blah").for(:email) }
#     it { should allow_value("a@b.com").for(:email) }
#     it { should validate_inclusion_of(:age).in_range(6..18) }
#
#   end
#   describe '#coach' do
#     it { should validate_presence_of(:institution) }
#     it { should validate_presence_of(:first_name) }
#     it { should validate_presence_of(:last_name) }
#     it { should_not allow_value("blah").for(:email) }
#     it { should allow_value("a@b.com").for(:email) }
#     it { should validate_inclusion_of(:phone_number).count.to_eq(10) }
#
#   end
#   describe '#recruiter' do
#     it { should validate_presence_of(:institution) }
#     it { should validate_presence_of(:username) }
#     it { should_not allow_value("blah").for(:email) }
#     it { should allow_value("a@b.com").for(:email) }
#     it { should validate_inclusion_of(:phone_number).count.to_eq(10) }
#
#   end
#   describe '#admin' do
#     it { should validate_presence_of(:username) }
#     it { should validate_inclusion_of(:password_digest) }
#   end
# end
