require 'net/http'
require 'typhoeus'

class BP_Search

  API_CALL = "http://api.steampowered.com/IEconItems_440/GetPlayerItems/v0001/?key="

  attr_accessor :steam_id
  def initialize(steam_id, hydra, index)
    @hydra = hydra
    @index = index
    @steam_id = steam_id
    retrieve_items
  end

  def retrieve_items
    url = API_CALL + APP_CONFIG["api_key"] + "&steamid=#{@steam_id}"
    raw_json = Typhoeus::Request.new(url)
    raw_json.on_complete do |response|
      if response.success?
        search! JSON.parse(response.body)
      else
        puts "steam oh noes!"
      end
    end
    @hydra.queue raw_json
  end

  def search!(json)
    puts "searching #{@index} bp"
    if json["result"]["status"] == 1
      Item.all.each do |item|
        if item.search json
          p = Player.new :steam_id => @steam_id
          if p.valid?
            p.save
            p.inventories.create :item => item
          end
        end
      end
    else
      puts "id: #{@steam_id} has a private bp"
    end
  end

end
