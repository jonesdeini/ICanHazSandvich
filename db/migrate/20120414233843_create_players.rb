class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :steam_id
      t.string :avatar

      t.timestamps
    end
  end
end
