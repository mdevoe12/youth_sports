class AddShotsToPlayerStats < ActiveRecord::Migration[5.1]
  def change
    add_column :player_stats, :two_points, :integer
    add_column :player_stats, :three_points, :integer
    add_column :player_stats, :free_throw, :integer
  end
end
