class CreateRecruiterProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :recruiter_profiles do |t|
      t.string :username
      t.string :institution
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
