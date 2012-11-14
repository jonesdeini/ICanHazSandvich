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
          call_playerinfo_scraper server_url, hydra
        end
      else
        puts "server url list request failed \n #{response.inspect}"
      end
    end
    hydra.run
  end

  def call_playerinfo_scraper(server_url, hydra)
    # over ride me bro
    raise NotImplementedError
  end

  def parse_server_addresses(server_list)
    # over ride me bro
    raise NotImplementedError
  end

end
