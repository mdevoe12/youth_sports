class DropRolesAndUserRoles < ActiveRecord::Migration[5.1]
  def change
    drop_table :roles
    drop_table :user_roles
  end
end
