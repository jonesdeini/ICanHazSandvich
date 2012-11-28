module ItemSearch

  def basic_search(json)
    item_count = 0
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        item_count = item_count + 1
      end
    end
    item_count
  end

  def crate_search(json)
    item_count = 0
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        if players_item["attributes"]
          players_item["attributes"].each do |attrs|
            if attrs["float_value"] == float_value
              item_count = item_count + 1
           end
         end
        end
      end
    end
    item_count
  end

  def quality_search(json)
    item_count = 0
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        if players_item["quality"] == quality
          item_count = item_count + 1
        end
      end
    end
    item_count
  end

  #NOTE this isn't ideal for this type of search
  # this is probably a good point to start the refactor with
  def vintange_lvl_search(json)
    item_count = 0
    json["result"]["items"].each do |players_item|
      if players_item["level"] == level
        if players_item["quality"] == quality
          item_count = item_count + 1
        end
      end
    end
    item_count
  end

end
