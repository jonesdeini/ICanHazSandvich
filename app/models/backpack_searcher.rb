require 'net/http'
require 'typhoeus'

class BackpackSearcher

  def initialize(json, steam_id)
    search! json, steam_id
  end

  def search!(json, steam_id)
    puts "searching #{steam_id} bp"
    if json["result"]["status"] == 1
      BaseItem.all.each do |item|
        if item.search json
          p = Player.find_or_initialize_by_steam_id steam_id
          if p.new_record?
            puts p.errors.full_messages.to_sentence unless p.save
          end
          unless p.items.include? item
            inv = p.inventories.new
            inv.item = item
            inv.save
          end
        end
      end
    else
      puts "id: #{steam_id} has a private bp"
    end
  end

end
