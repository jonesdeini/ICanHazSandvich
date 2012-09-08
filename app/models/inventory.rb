class Inventory < ActiveRecord::Base

  belongs_to :player
  belongs_to :item, :class_name => 'BaseItem', :foreign_key => 'item_id'

  before_create -> { self.count = 1 }

end
