class TwilioMessage


  def self.create_for_guardian(player, recruiter)
    # binding.pry
    # player = Player.find(player_info)
    phone_num = player.profile.guardian_phone
    TwilioService.send_recruiter_request(phone_num)

    Prospect.create(recruiter_profile_id: recruiter.profile.id,
                         player_profile_id: player.profile.id)
  end

end
