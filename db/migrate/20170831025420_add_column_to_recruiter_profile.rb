class AddColumnToRecruiterProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :recruiter_profiles, :recruiter, references: :users, index: true
    add_foreign_key :recruiter_profiles, :users, column: :recruiter_id
  end
end
