require 'item_search'

class Item < BaseItem

  include ItemSearch

  def search(json)
    basic_search(json, self)
  end

end
