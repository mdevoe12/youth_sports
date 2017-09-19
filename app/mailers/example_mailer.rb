class ExampleMailer < ActionMailer::Base
  default from: ENV['gmail_username']

  def sample_email(file)
    attachments["game.csv"] = file.tempfile.read
    mail(to: "matthew.devoe@gmail.com", subject: 'Sample Email')
  end
end
