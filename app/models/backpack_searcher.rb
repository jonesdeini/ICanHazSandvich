require 'net/http'
require 'typhoeus'

class BackpackSearcher

  API_CALL = "http://api.steampowered.com/IEconItems_440/GetPlayerItems/v0001/?key="

  def initialize(json, steam_id)
    search! json, steam_id
  end

  def search!(json, steam_id)
    if json["result"]["status"] == 1
      Item.all.each do |item|
        if item.search json
          p = Player.new :steam_id => steam_id
          if p.valid?
            p.save
            p.inventories.create :item => item
          end
        end
      end
    else
      puts "id: #{steam_id} has a private bp"
    end
  end

end
