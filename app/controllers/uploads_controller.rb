class UploadsController < ApplicationController

  def create
    file_path_to_save_to = './tmp/file.csv'
    File.write(file_path_to_save_to, params[:file].tempfile.read)
    CsvImporterJob.perform_later(file_path_to_save_to)
    redirect_to dashboard_index_path, notice: "Items imported"

      #  obj = S3_BUCKET.objects[params[:file].original_filename]
      #
      #  # Upload the file
      #  obj.write(
      #    file: params[:file],
      #    acl: :public_read
      #  )
      #
      #  # Create an object for the upload
      #  @upload = Upload.new(
      #  		url: obj.public_url,
   	# 	name: obj.key
      #  	)
      #
      #  # Save the upload
      #  if @upload.save
      #    redirect_to uploads_path, success: 'File successfully uploaded'
      #  else
      #    flash.now[:notice] = 'There was an error'
      #    render :new
      #  end

    # obj.write(
    #   file: params[:file],
    #   acl: :public_read
    # )
    #
    # s3.bucket("#{ENV['s3_bucket']}").obj('key').upload_file('test.csv')
    # @upload = Upload.new(
    #                 url: obj.public_url,
    #                 name: obj.key
    #                     )
    #
    # if @upload.save
    #   redirect_to dashboard_index_path, notice: "File uploaded"
    # else
    #   redirect_to dashboard_index_path, notice: "There was an error"
    # end

  end

end
