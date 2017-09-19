class UploadsController < ApplicationController

  def create
        ExampleMailer.sample_email(params[:file]).deliver

        redirect_to dashboard_index_path, notice: 'Email sent to admin.'

  end

end
