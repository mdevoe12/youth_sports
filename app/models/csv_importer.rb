require 'csv'
class CSVImporter

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def run
    ActiveRecord::Base.transaction do
      CSV.foreach(@file, headers: true, header_converters: :symbol) do |row|
        stat = PlayerStat.new(player_profile_id: Player.find(row[:id]).profile.id,
                                    game_id: row[:game_id],
                                     points:  row[:points],
                                      fouls:   row[:fouls])
        stat.save!
      end
    end
    UploadMailer.email_coach.deliver
  end

end
