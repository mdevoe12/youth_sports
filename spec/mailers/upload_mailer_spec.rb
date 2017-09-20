require 'rails_helper'

RSpec.describe UploadMailer, type: :mailer do
  describe 'email_coach' do

  let(:mail) { described_class.email_coach.deliver_now}

    it "renders the subject" do
      expect(mail.subject).to eq('Import Successful')
    end

    it "render the receiver email" do
      expect(mail.to).to eq(["matthew.devoe@gmail.com"])
    end
  end
end
