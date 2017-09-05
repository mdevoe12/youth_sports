class TwilioService

  def self.connect
    @client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_token']
  end

  def self.send_recruiter_request(phone_num)
    connect
    message = {
          to: "+1#{phone_num}",
          from: "+13157571027",
          body: 'A recruiter is interested in your athlete. Please respond
                 with Yes if you are interested or No if you are not.'
          }
    @client.messages.create(message)
  end

end
