class RemovePasswordFromPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :password
    remove_column :coaches, :password_digest
    remove_column :recruiters, :password_digest
    remove_column :admins, :password_digest
  end
end
