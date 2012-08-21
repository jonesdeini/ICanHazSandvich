module ItemSearch

  def basic_search(json)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        return true
      end
    end
    return false
  end

  def quality_search(json)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        if players_item["quality"] == quality
          return true
        end
      end
    end
    return false
  end

  def crate_search(json)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        if players_item["attributes"]
          return true if players_item["attributes"]["float_value"] == float_value
        end
      end
    end
    return false
  end

end
