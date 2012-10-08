require 'typhoeus'

class BackpackSearcher

  def initialize(backpack, steam_id)
    search! backpack, steam_id
  end

  def search!(backpack, steam_id)
    if backpack["result"]["status"] == 1 && backpack["result"]["num_backpack_slots"] != 50

      # if the player already exists delete their inventory so it
      # can be refreshed
      p = Player.find_or_initialize_by_steam_id steam_id
      if p.new_record?
        puts p.errors.full_messages.to_sentence unless p.save
      else
        p.inventories.delete_all
      end

      BaseItem.all.each do |item|
        item_count = item.search backpack
        unless item_count == 0
          inv = p.inventories.new
          inv.item = item
          inv.item_count = item_count
          inv.save
        end
      end


      if p.items.any?
        p.get_player_info if p.name.nil?
      else
        p.delete
      end
    else
      puts "id: #{steam_id} has a private bp"
    end
  end

end
