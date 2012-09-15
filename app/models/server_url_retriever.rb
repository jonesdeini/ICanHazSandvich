class ServerUrlRetriever

  def initialize(url)
    @url = url
    retrieve_server_urls
  end

  def retrieve_server_urls
    hydra = Typhoeus::Hydra.new(max_concurrency: 8)
    server_list = Typhoeus::Request.new @url
    server_list.on_complete do |response|
      server_addresses = parse_server_addresses response.body
      server_addresses.each do |server_url|
        playerinfo_url_list = parse_player_info_page_addresses server_url
        playerinfo_url_list.each_with_index do |url, index|
          id_page[index] = Typhoeus::Request.new(url)
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
