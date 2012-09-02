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
          p = Player.new 
          # mass assignment thing
          p.steam_id = steam_id
          if p.save
            puts "saved!"
            inv = p.inventories.new
            inv.item = item
            inv.save
          else
            puts p.errors.full_messages
          end
        end
      end
    else
      puts "id: #{steam_id} has a private bp"
    end
  end

end
