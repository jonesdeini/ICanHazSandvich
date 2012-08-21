require 'item_search'

class Hat < BaseItem

  include ItemSearch

  def search(json)
    ItemSearch.basic_search(json, self)
  end

end
