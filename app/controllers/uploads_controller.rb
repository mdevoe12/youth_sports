class UploadsController < ApplicationController

  def create
    PlayerStat.import(params[:file])
    redirect_to dashboard_index_path, notice: "Items imported"
  end

end
