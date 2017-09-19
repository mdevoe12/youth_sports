class AddNamesToPlayerProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :player_profiles, :first_name, :string
    add_column :player_profiles, :last_name, :string
  end
end
