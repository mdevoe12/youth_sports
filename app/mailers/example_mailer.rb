class ExampleMailer < ActionMailer::Base
  default from: ENV['gmail_username']

  def sample_email
    
    mail(to: "matthew.devoe@gmail.com", subject: 'Sample Email')
  end
end
