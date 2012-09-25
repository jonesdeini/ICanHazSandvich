require 'typhoeus'

class PlayerInfoScraper

  class << self

    def scrape(server_url, hydra, regex)
      hydra.queue(playerinfo_url_list = Typhoeus::Request.new(server_url))
      playerinfo_url_list.on_complete do |response|
        if response.success?
          playerinfo_urls = response.body.scan(regex).compact.uniq.flatten
          playerinfo_urls.each do |playerinfo_url|
            SteamIdScraper.scrape playerinfo_url, hydra
          end
        else
          puts "player info url list request failed"
        end
      end
    end

  end
end
