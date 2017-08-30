class AddRoleToRecruiter < ActiveRecord::Migration[5.1]
  def change
    add_column :recruiters, :role, :integer, default: 2
  end
end
