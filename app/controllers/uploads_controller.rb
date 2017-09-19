require 'csv'
class UploadsController < ApplicationController


  def create
    CSVImporter.import_game_records(params[:file])
    redirect_to dashboard_index_path, notice: "Items imported"
  end

end
