class AddStatusToPlayerProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :player_profiles, :status, :integer
  end
end
