class AddRoleToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :role, :integer, default: 0
  end
end
