class AddNewPlayersCountToItems < ActiveRecord::Migration
  def change
    add_column :items, :new_players_count, :integer, default: 0
  end
end
