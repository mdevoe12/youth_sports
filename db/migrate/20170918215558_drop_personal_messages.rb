class DropPersonalMessages < ActiveRecord::Migration[5.1]
  def change
    drop_table :personal_messages
  end
end
