class Inventory < ActiveRecord::Base

  belongs_to :player
  belongs_to :item, :class_name => 'BaseItem', :foreign_key => 'item_id'

end
