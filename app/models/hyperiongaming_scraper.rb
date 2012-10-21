class HyperiongamingScraper < ServerUrlRetriever

  def initialize
    super "http://stats.hyperiongaming.org/tf"
  end

  def call_playerinfo_scraper(server_url, hydra)
    regex = /(http\:\/\/stats\.hyperiongaming\.org\/playerinfo\/\d+)/
    PlayerInfoScraper.scrape server_url, hydra, regex
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/stats\.hyperiongaming\.org\/overview\/\d+)/).compact.uniq.flatten
  end

end
