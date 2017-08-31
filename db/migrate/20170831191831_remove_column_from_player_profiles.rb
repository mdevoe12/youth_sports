class RemoveColumnFromPlayerProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :player_profiles, :username, :string
  end
end
