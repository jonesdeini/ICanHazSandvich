require 'item_search'

class BaseItem < ActiveRecord::Base

  include ItemSearch

  self.table_name = "items"

  has_many :inventories, :foreign_key => "item_id"
  has_many :players, :through => :inventories

  # NOTE vintage lvl0 items dont need a defindex
  # Future plans are to expand search to fill in defindex. This requires
  # we have all items in the database(for filled in defindex to mean something)
  validates_presence_of :name#, :defindex
  validates_uniqueness_of :name

  attr_accessible :defindex, :float_value, :level, :name, :quality

  # i wonder which error this would raise if it had 0 params
  def search(json)
    # over ride me bro!
    raise MethodNotImplementedError
  end

end
