class TwilioController < ApplicationController

  def create
    player = Player.find(params[:player_id])
    phone = player.profile.guardian_phone
    @client = Twilio::REST::Client.new ENV['live_twilio_sid'], ENV['live_twilio_token']

    @message = @client.messages.create({
      to: "+1#{phone}",
      from: "+13157571027",
      body: 'This is a message sent from youth sports',
      status_callback: "http://requestb.in/testingyouthsports"
      })

      Prospect.create(recruiter_profile_id: current_user.profile.id,
                         player_profile_id: player.profile.id)


      flash[:notice] = "You've sent a request to the player's guardian."
      redirect_to profiles_path(player)
  end

end
