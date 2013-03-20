class AddHideToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :hide, :boolean, default: false
  end
end
