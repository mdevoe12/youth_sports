class AddNamesToRecruiterProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :recruiter_profiles, :first_name, :string
    add_column :recruiter_profiles, :last_name, :string
  end
end
