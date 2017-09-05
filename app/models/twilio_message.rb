class TwilioMessage


  def self.create_for_guardian(player_info)
    player = Player.find(player_info)
    phone_num = player.profile.guardian_phone
    TwilioService.send_recruiter_request(phone_num)
  end

end
