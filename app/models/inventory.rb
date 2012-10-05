class Inventory < ActiveRecord::Base

  belongs_to :player#, :counter_cache => true
  belongs_to :item, :class_name => 'BaseItem', :foreign_key => 'item_id'

  #before_create -> { self.item_count = 1 }

end
