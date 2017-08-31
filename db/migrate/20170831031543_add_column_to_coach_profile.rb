class AddColumnToCoachProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :coach_profiles, :coach, references: :users, index: true
    add_foreign_key :coach_profiles, :users, column: :coach_id
  end
end
