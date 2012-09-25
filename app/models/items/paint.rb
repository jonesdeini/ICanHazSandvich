require 'item_search'

class Paint < BaseItem

  include ItemSearch

  def search(json)
    ItemSearch.basic_search(json, self)
  end

end
