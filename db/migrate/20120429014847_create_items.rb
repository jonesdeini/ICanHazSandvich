class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :float_value
      t.integer :defindex
      t.integer :quality
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
