class AddInventoriesCountToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :inventories_count, :integer
  end
end
