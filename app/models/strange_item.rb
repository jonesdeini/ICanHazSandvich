require 'item_search'

class StrangeItem < BaseItem

  include ItemSearch

  def search(json)
    ItemSearch.quality_search(json, self)
  end

end
