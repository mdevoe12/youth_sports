class TwilioMessage

  def self.send_recruiter_request(phone_num)
    TwilioMessage.new
    TwilioService.send_recruiter_request(phone_num)
  end

end
