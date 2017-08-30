class AddRoleToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :role, :integer, default: 3
  end
end
