require 'typhoeus'

class BackpackRetriever

  API_CALL = "http://api.steampowered.com/IEconItems_440/GetPlayerItems/v0001/?key="

  def initialize(hydra, steam_id)
    retrieve_items! hydra, steam_id
  end

  def retrieve_items!(hydra, steam_id)
    url = API_CALL + APP_CONFIG["api_key"] + "&steamid=#{steam_id}"
    steam_items_request = Typhoeus::Request.new(url)
    steam_items_request.on_complete do |response|
      if response.success?
        BackpackSearcher.new JSON.parse(response.body), steam_id
      else
        puts "steam oh noes!"
      end
    end
    hydra.queue steam_items_request
  end

end
