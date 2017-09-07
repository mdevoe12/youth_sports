class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :facility, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
