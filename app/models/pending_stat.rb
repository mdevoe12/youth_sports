class PendingStat < ApplicationRecord
  

  def self.import(file)
    ActiveRecord::Base.transaction do
      CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
        # return false unless Player.exists?(row[:id]) == true
        stat = PendingStat.create(player_profile_id: Player.find(row[:id]).profile.id,
                                    game_id: row[:game_id],
                                     points:  row[:points],
                                      fouls:   row[:fouls])
        stat.save!
      end
      # return true
    end
  end

end
