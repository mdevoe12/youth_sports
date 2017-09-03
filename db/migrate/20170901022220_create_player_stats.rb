class CreatePlayerStats < ActiveRecord::Migration[5.1]
  def change
    create_table :player_stats do |t|
      t.integer :points
      t.integer :fouls
      t.references :player_profile, foreign_key: true

      t.timestamps
    end
  end
end
