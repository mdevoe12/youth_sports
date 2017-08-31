class RemoveColumnsFromAdminProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :admin_profiles, :username, :string
    remove_column :admin_profiles, :password_digest, :string
  end
end
