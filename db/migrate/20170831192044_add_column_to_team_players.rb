class AddColumnToTeamPlayers < ActiveRecord::Migration[5.1]
  def change
    add_reference :team_players, :player, references: :users, index: true
    add_foreign_key :team_players, :users, column: :player_id
  end
end
