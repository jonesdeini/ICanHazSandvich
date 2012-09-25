class AddTradedToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :traded, :boolean
  end
end
