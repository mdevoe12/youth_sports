class UploadsController < ApplicationController

  def create
    file_path_to_save_to = './tmp/file.csv'
    File.write(file_path_to_save_to, params[:file].tempfile.read)
    CsvImporterJob.perform_later(file_path_to_save_to)
    redirect_to dashboard_index_path, notice: "Items imported"
  end

end
