require 'item_search'

class BaseItem < ActiveRecord::Base

  include ItemSearch

  set_table_name "items"

  has_many :inventories
  has_many :players, :through => :inventories

  # i wonder which error this would raise if it had 0 params
  def search(json)
    # over ride me bro!
    raise MethodNotImplementedError
  end

end
