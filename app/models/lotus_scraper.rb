class LotusScraper < ServerUrlRetriever

  def initialize
    super "http://stats.lotusclan.com/tf"
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/stats\.lotusclan\.com\/overview\/\d+)/).compact.uniq.flatten
  end

end
