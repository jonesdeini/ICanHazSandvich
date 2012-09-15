class LotusScraper < ServerUrlRetriever

  # TODO make this return the url to player info
  def parse_player_info_page_addresses(url)
    url.scan(/http\:\/\/stats\.lotusclan\.com\/playerinfo\/(\d+)/).compact.uniq
  end

  def parse_server_addresses(url)
    url.scan(/http\:\/\/stats\.lotusclan\.com\/overview\/(\d+)/).compact.uniq
  end

end
