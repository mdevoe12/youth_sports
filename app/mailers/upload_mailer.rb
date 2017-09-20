class UploadMailer < ActionMailer::Base
  default from: ENV['gmail_username']

  def email_coach
    mail(to: "matthew.devoe@gmail.com", subject: 'Import Successful')
  end


end
