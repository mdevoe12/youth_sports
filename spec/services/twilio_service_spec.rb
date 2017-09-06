require 'rails_helper'

RSpec.describe TwilioService do
  context "Twilio connection" do
    it "returns a valid connection" do
      VCR.use_cassette("/services/twilio_service_spec.rb") do
        connection = TwilioService.connect

        expect(connection.username).to eq(ENV['twilio_sid'])
        expect(connection.auth_token).to eq(ENV['twilio_token'])        
      end
    end
  end
end
