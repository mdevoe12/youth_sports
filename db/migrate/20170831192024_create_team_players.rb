class CreateTeamPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_players do |t|
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
