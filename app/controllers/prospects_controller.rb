class ProspectsController < ApplicationController

  def create
    @profile = Player.find_by(id: params[:player_id]).profile

    @profile.prospects.create!(recruiter_profile_id: current_user.profile.id,
                              player_profile_id: @profile.id,
                              status: 0)
    redirect_to recruiter_profile_path(current_user.id)
  end

  def update
    @prospect = Prospect.find(params[:id])
    @prospect.update(status: 3)
    redirect_to recruiter_profile_path(current_user.id)
  end

  private
    def prospect_params
      params.permit(:prospect).require(:recruiter_profile_id,
                                       :player_profile_id,
                                       :status)
    end
end
