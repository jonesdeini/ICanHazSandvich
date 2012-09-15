require 'item_search'

class BaseItem < ActiveRecord::Base

  include ItemSearch

  self.table_name = "items"

  has_many :inventories, :foreign_key => "item_id"
  has_many :players, :through => :inventories

  validates_presence_of :name, :defindex
  validates_uniqueness_of :name

  # i wonder which error this would raise if it had 0 params
  def search(json)
    # over ride me bro!
    raise MethodNotImplementedError
  end

end
