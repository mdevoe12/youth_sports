class AddColumnsToTeamCoaches < ActiveRecord::Migration[5.1]
  def change
    add_reference :team_coaches, :coach, references: :users, index: true
    add_foreign_key :team_coaches, :users, column: :coach_id
  end
end
