class AddGameReferenceToPlayerStats < ActiveRecord::Migration[5.1]
  def change
    add_reference :player_stats, :game, foreign_key: true
  end
end
