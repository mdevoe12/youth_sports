class RemoveColumnsFromRecruiterProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :recruiter_profiles, :username, :string
    remove_column :recruiter_profiles, :password_digest, :string
  end
end
