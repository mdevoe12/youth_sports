class CreateFavoritePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_players do |t|
      t.string :screen_name

      t.timestamps
    end
  end
end
