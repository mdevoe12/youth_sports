class CreatePlayerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :player_profiles do |t|
      t.string :username
      t.string :school
      t.string :height
      t.string :weight
      t.integer :grade_level
      t.float :gpa
      t.string :guardian_phone

      t.timestamps
    end
  end
end
