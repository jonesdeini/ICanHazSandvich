require 'item_search'

class Crate < BaseItem

  include ItemSearch

  def search(json)
    ItemSearch.crate_search(json, self)
  end

end
