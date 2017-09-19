class AddNamesToCoachProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :coach_profiles, :first_name, :string
    add_column :coach_profiles, :last_name, :string
  end
end
