class AddCountToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :count, :integer
  end
end
