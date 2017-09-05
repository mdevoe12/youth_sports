class TwilioController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:update]

  def create
    player = Player.find(params[:player_id])
    phone_num = player.profile.guardian_phone
    TwilioService.send_recruiter_request(phone_num)
    # message = TwilioMessage.new
    # TwilioMessage.send_recruiter_request(phone_num)

    Prospect.create(recruiter_profile_id: current_user.profile.id,
                         player_profile_id: player.profile.id)


      flash[:notice] = "You've sent a request to the player's guardian."
      redirect_to profiles_path(player)
  end

  def update
    phone = params[:From]
    phone[0] = ''
    player_prospects = PlayerProfile.find_by(guardian_phone: phone).prospects[0]
    if params[:Body] == "Yes"
      player_prospects.status = "prospect"
      player_prospects.save
    elsif params[:Body] == "No"
      player_prospects.status = "denied"
      player_prospects.save
    end
  end
end
