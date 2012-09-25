class LotusScraper < ServerUrlRetriever

  def initialize
    super "http://stats.lotusclan.com/tf"
  end

  def call_playerinfo_scraper(server_url, hydra)
    regex = /(http\:\/\/stats\.lotusclan\.com\/playerinfo\/\d+)/
    PlayerInfoScraper.scrape server_url, hydra, regex
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/stats\.lotusclan\.com\/overview\/\d+)/).compact.uniq.flatten
  end

end
