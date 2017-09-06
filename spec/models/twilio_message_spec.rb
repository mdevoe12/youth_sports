require 'rails_helper'

RSpec.describe TwilioMessage do
  context "it initializes properly" do
    it "when passed phone_num" do
      message = TwilioMessage.new("13035555555")

      expect(message.to).to eq("+13035555555")
      expect(message.from).to eq("+13157571027")
      expect(message.body.class).to eq(String)
      expect(message.token.class).to eq(String)
      expect(message.token.length).to eq(5)
    end
  end
end
