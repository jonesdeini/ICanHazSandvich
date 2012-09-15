require 'net/http'
require 'typhoeus'

class PlayerInfoScraper

  class << self

    def scrape(url, hydra)
      page = retrieve_source(url)
      playerinfo_id_list = parse_source(page, PLAYER_LIST_REGEX)
      puts "parsed player info ids"
      steam_idz = []
      id_page = []
      playerinfo_id_list.each_with_index do |id, index|
        id_page[index] = Typhoeus::Request.new(PLAYER_INFO + id.first.to_s)
        id_page[index].on_complete do |response|
          if response.success?
            puts "xxl request #{index} complete"
            steam_id = (parse_source(id_page[index].response.body, STEAM_ID_REGEX)).first.try(:first)
            BackpackRetriever.new(hydra, index, steam_id) if steam_id
          else
            puts "oh noes!"
          end
        end
        hydra.queue id_page[index]
      end
    end

    def retrieve_source(url)
      Net::HTTP.get_response(URI.parse(url)).body
    end

    def parse_source(page, regexp)
      player_info_id = page.scan regexp
      player_info_id.compact.uniq
    end

  end
end
