class TwilioController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:update]

  def create
    player = Player.find(params[:player_id])
    TwilioMessage.create_for_guardian(player, current_user)
    flash[:notice] = "You've sent a request to the player's guardian."
    redirect_to profiles_path(player)
  end

  def update
    response = params[:Body].split
    player_prospect = (Prospect.find_by(token: response[0]))
    player_prospect.update_prospect(response, player_prospect)
  end

end
