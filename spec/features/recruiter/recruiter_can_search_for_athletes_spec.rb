equire 'rails_helper'

RSpec.feature "recruiter can use navbar links" do
    before(:each) do
      @recruiter = User.create(type: "Recruiter",
                          first_name: "test",
                          last_name: "test",
                          password: "123")
      @recr_profile = RecruiterProfile.create(recruiter_id: @recruiter.id)
      @player = User.create(type: "Player", first_name: "Henry", last_name: "Ford", password: "123")
      @profile = PlayerProfile.create(player_id: @player.id, guardian_phone: "16073426730")
      @facility = Facility.create(name: "test")
      @game = Game.create!(facility_id: @facility.id, status: 0)
      @team = Team.create(name: "Broncos")
      @team.players << @player
      PlayerStat.create(points: 40, fouls: 20, player_profile: @profile, game_id: @game.id)
      Prospect.create(recruiter_profile_id: @recr_profile.id, player_profile_id: @profile.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@recruiter)
    end




  end
