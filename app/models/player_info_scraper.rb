require 'typhoeus'

class PlayerInfoScraper

  class << self

    def scrape(server_url, hydra)
      hydra.queue(playerinfo_url_list = Typhoeus::Request.new(server_url))
      playerinfo_url_list.on_complete do |response|
        if response.success?
          playerinfo_urls = parse_player_info_page_addresses response.body
          puts playerinfo_urls.inspect

        else
          puts "player info url list request failed"
        end
      end
    end

    def parse_source(page, regexp)
      player_info_id = page.scan regexp
      player_info_id.compact.uniq
    end

  def parse_player_info_page_addresses(url)
    url.scan(/(http\:\/\/stats\.lotusclan\.com\/playerinfo\/\d+)/).compact.uniq.flatten
  end

  end
end
