class AddLevelToItems < ActiveRecord::Migration
  def change
    add_column :items, :level, :integer
  end
end
