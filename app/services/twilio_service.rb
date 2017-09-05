class TwilioService

  def self.connect
    @client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_token']
  end

  def self.send_recruiter_request(message)
    connect
    @client.messages.create({
                          to: message.to,
                        from: message.from,
                        body: message.body
                           })
  end

end
