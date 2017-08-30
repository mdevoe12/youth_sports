class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :school
      t.string :height
      t.string :weight
      t.integer :grade_level
      t.float :gpa
      t.string :guardian_phone
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
