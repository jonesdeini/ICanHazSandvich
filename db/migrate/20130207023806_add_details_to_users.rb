class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :steam_id, :string
    add_column :users, :name, :string
  end
end
