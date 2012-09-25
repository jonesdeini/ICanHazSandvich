require 'typhoeus'

class SteamIdScraper

  class << self

    def scrape(playerinfo_id_url, hydra)
      hydra.queue(playerinfo_page = Typhoeus::Request.new(playerinfo_id_url))
      playerinfo_page.on_complete do |response|
        if response.success?
          steam_id = response.body.scan(/http\:\/\/steamcommunity\.com\/profiles\/(\d+)/).flatten.first
          BackpackRetriever.new(hydra, 0, steam_id) if steam_id
        else
          puts "player info page request failed"
        end
      end
    end

  end
end
