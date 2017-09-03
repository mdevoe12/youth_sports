class Profiles::PlayerProfilesController < ApplicationController

  def show
    account_sid = ENV['live_twilio_sid']
    auth_token = ENV['live_twilio_token']

      # @client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_test_token']
      @client = Twilio::REST::Client.new account_sid, auth_token

      binding.pry
      @message = @client.messages.create({
        to: '+16073426730',
        from: "+13157571027",
        body: 'This is sent from your twilio_service.rb file'
        })

  end

end
