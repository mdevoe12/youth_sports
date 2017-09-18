class UploadsController < ApplicationController

  def create
    if PlayerStat.import(params[:file]) == true
      redirect_to dashboard_index_path, notice: "Items imported"
    else
      redirect_to dashboard_index_path, notice: "Error Encountered"
    end
  end

end
