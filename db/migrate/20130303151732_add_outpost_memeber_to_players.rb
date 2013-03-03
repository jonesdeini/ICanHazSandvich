class AddOutpostMemeberToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :outpost_member, :boolean
  end
end
