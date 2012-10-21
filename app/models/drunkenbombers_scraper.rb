class DrunkenbombersScraper < ServerUrlRetriever

  def initialize
    super "http://db.gameme.com"
  end

  def call_playerinfo_scraper(server_url, hydra)
    regex = /(http\:\/\/db\.gameme\.com\/playerinfo\/\d+)/
    PlayerInfoScraper.scrape server_url, hydra, regex
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/db\.gameme\.com\/overview\/\d+)/).compact.uniq.flatten
  end

end
