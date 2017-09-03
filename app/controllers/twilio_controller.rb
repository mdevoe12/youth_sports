class TwilioController < ApplicationController

  def create
    @client = Twilio::REST::Client.new ENV['live_twilio_sid'], ENV['live_twilio_token']

    @message = @client.messages.create({
      to: '+16073426730',
      from: "+13157571027",
      body: 'This is sent from your twilio_service.rb file',
      status_callback: "http://requestb.in/testingyouthsports"
      })

      flash[:notice] = "You've sent a request to the player's guardian."
      redirect_to profiles_path(player)
  end

end
