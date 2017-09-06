class TwilioMessage

  attr_reader :to,
              :from,
              :body,
              :token

  def initialize(phone_num)
    @to = "+#{phone_num}"
    @from = "+13157571027"
    @body = 'A recruiter is interested in your athlete. Please respond
           with Yes if you are interested or No if you are not.'
    @token = "#{rand(97..122).chr}#{rand(1000..9999)}"
  end

  def self.create_for_guardian(player, recruiter)
    phone_num = player.profile.guardian_phone
    message = TwilioMessage.new(phone_num)
    binding.pry
    TwilioService.send_recruiter_request(message)
    Prospect.create(recruiter_profile_id: recruiter.profile.id,
                         player_profile_id: player.profile.id)
  end
end
