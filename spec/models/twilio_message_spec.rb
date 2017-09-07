require 'rails_helper'

RSpec.describe TwilioMessage do
  context "it initializes properly" do
    it "when passed phone_num" do
      message = TwilioMessage.new("13035555555")

      expect(message.to).to eq("+13035555555")
      expect(message.from).to eq("+13157571027")
      expect(message.body.class).to eq(String)
      expect(message.token.class).to eq(String)
      expect(message.token.length).to eq(5)
    end
  end

  context "create for guardian" do
    it "returns" do
      @recruiter = User.create(type: "Recruiter",
                          first_name: "test",
                          last_name: "test",
                          password: "123")
      @recr_profile = RecruiterProfile.create(recruiter_id: @recruiter.id)
      @player = User.create(type: "Player", password: "123")
      @profile = PlayerProfile.create(player_id: @player.id, guardian_phone: "16073426730")
      PlayerStat.create(points: 40, fouls: 20, player_profile: @profile)

      VCR.use_cassette("/models/twilio_message_spec.rb") do
        TwilioMessage.create_for_guardian(@player, @recruiter)

        expect(@player.profile.prospects.last.status).to eq("in-progress")
      end
    end
  end

end
