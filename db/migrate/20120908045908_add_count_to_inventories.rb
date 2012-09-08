class AddCountToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :item_count, :integer
  end
end
