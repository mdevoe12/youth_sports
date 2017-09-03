class CreateProspects < ActiveRecord::Migration[5.1]
  def change
    create_table :prospects do |t|
      t.references :recruiter_profile, foreign_key: true
      t.references :player_profile, foreign_key: true

      t.timestamps
    end
  end
end
