class GamelibertyScraper < ServerUrlRetriever

  def initialize
    super "http://gameliberty.gameme.com"
  end

  def call_playerinfo_scraper(server_url, hydra)
    regex = /(http\:\/\/gameliberty\.gameme\.com\/playerinfo\/\d+)/
    PlayerInfoScraper.scrape server_url, hydra, regex
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/gameliberty\.gameme\.com\/overview\/\d+)/).compact.uniq.flatten
  end

end
