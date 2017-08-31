class RemoveColumnsFromCoachProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :coach_profiles, :password_digest, :string
    remove_column :coach_profiles, :first_name, :string
    remove_column :coach_profiles, :last_name, :string
  end
end
