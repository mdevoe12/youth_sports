class AddColumnToPlayerProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :player_profiles, :player, references: :users, index: true
    add_foreign_key :player_profiles, :users, column: :player_id
  end
end
