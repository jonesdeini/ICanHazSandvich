class IntoxgamingScraper < ServerUrlRetriever

  def initialize
    super "http://intoxgaming.gameme.com"
  end

  def call_playerinfo_scraper(server_url, hydra)
    regex = /(http\:\/\/intoxgaming\.gameme\.com\/playerinfo\/\d+)/
    PlayerInfoScraper.scrape server_url, hydra, regex
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/intoxgaming\.gameme\.com\/tf\d+)/).compact.uniq.flatten
  end

end
