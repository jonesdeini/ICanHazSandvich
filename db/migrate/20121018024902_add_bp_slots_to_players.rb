class AddBpSlotsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :bp_slots, :integer
  end
end
