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

    it "sends a message" do
      VCR.use_cassette("/services/twilio_service_spec.rb") do
        message = TwilioMessage.new("16073426730")
        request = TwilioService.send_recruiter_request(message)

        expect(request.to).to eq(message.to)
        expect(request.from).to eq(message.from)
        expect(request.uri).to eq("/2010-04-01/Accounts/#{ENV['twilio_sid']}/Messages/#{request.sid}.json")
      end
    end
  end
end
