class TopnotchScraper < ServerUrlRetriever

  def initialize
    super "http://monthly.topnotchclan.com/tf"
  end

  def call_playerinfo_scraper(server_url, hydra)
    regex = /(http\:\/\/monthly\.topnotchclan\.com\/playerinfo\/\d+)/
    PlayerInfoScraper.scrape server_url, hydra, regex
  end

  def parse_server_addresses(server_list)
    server_list.scan(/(http\:\/\/monthly\.topnotchclan\.com\/overview\/\d+)/).compact.uniq.flatten
  end

end
