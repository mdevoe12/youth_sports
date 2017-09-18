class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def sample_email
    mail(to: "matthew.devoe@gmail.com", subject: 'Sample Email')
  end
end
