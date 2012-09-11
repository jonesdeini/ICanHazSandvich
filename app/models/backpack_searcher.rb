require 'net/http'
require 'typhoeus'

class BackpackSearcher

  def initialize(json, steam_id)
    search! json, steam_id
  end

  def search!(json, steam_id)
    puts "searching #{steam_id} bp" unless Rails.env == "test"
    if json["result"]["status"] == 1

      # if the player already exists delete their inventory so it
      # can be refreshed
      p = Player.find_or_initialize_by_steam_id steam_id
      if p.new_record?
        puts p.errors.full_messages.to_sentence unless p.save
      else
        p.inventories.delete_all
      end

      BaseItem.all.each do |item|
        item_count = item.search json
        unless item_count == 0
          inv = p.inventories.new
          inv.item = item
          inv.item_count = item_count
          inv.save
        end
      end

      # TODO make total_items scope on Player and delete when 0
      if p.items.any?
        p.get_player_info
      else
        p.delete
      end
    else
      puts "id: #{steam_id} has a private bp"
    end
  end

end
