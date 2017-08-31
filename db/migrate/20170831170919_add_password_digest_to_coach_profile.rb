class AddPasswordDigestToCoachProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :coach_profiles, :password_digest, :string
  end
end
