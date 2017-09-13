class DropRolesAndUserRoles < ActiveRecord::Migration[5.1]
  def change
    drop_table :roles, force: :cascade
    drop_table :user_roles, force: :cascade
  end
end
