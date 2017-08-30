class CreateRecruiters < ActiveRecord::Migration[5.1]
  def change
    create_table :recruiters do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :institution
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
