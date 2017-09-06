class AddTokenToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :prospects, :token, :string
  end
end
