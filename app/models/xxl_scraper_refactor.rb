class XxlScraperRefactor < ServerUrlRetriever

  def initialize
    super "http://xxlgamers.gameme.com/tf"
  end

  def call_playerinfo_scraper(server_url, hydra)
    regex = /(http\:\/\/xxlgamers\.gameme\.com\/playerinfo\/\d+)/
    PlayerInfoScraper.scrape server_url, hydra, regex
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/xxlgamers\.gameme\.com\/overview\/\d+)/).compact.uniq.flatten
  end

end
