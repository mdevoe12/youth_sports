class SendEmailJob < ApplicationJob
  queue_as :default

  def perform
    UploadMailer.email_coach.deliver
  end
end
