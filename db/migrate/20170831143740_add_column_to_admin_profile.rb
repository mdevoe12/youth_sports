class AddColumnToAdminProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :admin_profiles, :admin, references: :users, index: true
    add_foreign_key :admin_profiles, :users, column: :admin_id
  end
end
