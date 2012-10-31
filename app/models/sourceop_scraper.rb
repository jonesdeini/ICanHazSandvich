class SourceopScraper < ServerUrlRetriever

  def initialize
    super "http://sourceop.gameme.com/tf"
  end

  def call_playerinfo_scraper(server_url, hydra)
    regex = /(http\:\/\/sourceop\.gameme\.com\/playerinfo\/\d+)/
    PlayerInfoScraper.scrape server_url, hydra, regex
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/sourceop\.gameme\.com\/overview\/\d+)/).compact.uniq.flatten
  end

end
