class ProspectsController < ApplicationController

  def create
    @profile = Player.find_by(id: params[:player_id]).profile

    @profile.prospects.find_or_create_by(recruiter_profile_id: current_user.profile.id,
                              player_profile_id: @profile.id,
                              status: 4)
    redirect_to dashboard_index_path
  end

  def destroy
    Prospect.find(params[:id]).destroy

    redirect_to dashboard_index_path
  end

  private
    def prospect_params
      params.permit(:prospect).require(:recruiter_profile_id,
                                       :player_profile_id,
                                       :status)
    end
end
