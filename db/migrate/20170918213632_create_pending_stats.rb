class CreatePendingStats < ActiveRecord::Migration[5.1]
  def change
    create_table :pending_stats do |t|
      t.string :coach_id
      t.string :game_id
      t.string :player_id
      t.string :points
      t.string :fouls

      t.timestamps
    end
  end
end
