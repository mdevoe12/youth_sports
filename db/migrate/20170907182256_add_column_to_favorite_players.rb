class AddColumnToFavoritePlayers < ActiveRecord::Migration[5.1]
  def change
    add_reference :favorite_players, :player, references: :users, index: true
    add_foreign_key :favorite_players, :users, column: :player_id
  end
end
