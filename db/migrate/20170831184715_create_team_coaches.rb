class CreateTeamCoaches < ActiveRecord::Migration[5.1]
  def change
    create_table :team_coaches do |t|
      t.references :team, foreign_key: true
    end
  end
end
