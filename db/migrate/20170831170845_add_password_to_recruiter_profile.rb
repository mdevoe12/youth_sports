class AddPasswordToRecruiterProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :recruiter_profiles, :password_digest, :string
  end
end
