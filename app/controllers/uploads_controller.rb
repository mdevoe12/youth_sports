class UploadsController < ApplicationController

  def create
    respond_to do |format|


        # Sends email to user when user is created.
        ExampleMailer.sample_email.deliver

        format.html { redirect_to dashboard_index_path, notice: 'User was successfully created.' }


    end
  end

end
