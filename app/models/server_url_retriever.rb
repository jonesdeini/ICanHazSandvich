require 'typhoeus'

class ServerUrlRetriever

  def initialize(url)
    @url = url
    retrieve_server_urls
  end

  def retrieve_server_urls
    hydra = Typhoeus::Hydra.new(max_concurrency: 8)
    hydra.queue(server_list = Typhoeus::Request.new(@url))
    server_list.on_complete do |response|
      if response.success?
        server_addresses = parse_server_addresses response.body
      server_addresses.each do |server_url|
        # NOTE could wrap this in a method on child class
        # giving clan specific regex
        PlayerInfoScraper.scrape server_url, hydra
      end
      else
        puts "server url list request failed"
      end
    end
    hydra.run
  end

  def parse_server_addresses(url)
    # over ride me bro
  end

  def parse_player_info_page_addresses(url)
    # over ride me bro
  end

end
