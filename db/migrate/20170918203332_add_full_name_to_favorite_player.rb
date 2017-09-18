class AddFullNameToFavoritePlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_players, :full_name, :string
  end
end
