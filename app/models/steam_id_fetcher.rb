require 'typhoeus'

class SteamIdFetcher

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :clan_url, :steam_ids, :errors

  def initialize(clan_url)
    @clan_url = clan_url
    @hydra = Typhoeus::Hydra.new(max_concurrency: 8)
    @steam_ids = []
    @errors = []
  end

  def go!
    crawler [@clan_url]
    @hydra.run
  end

  private

  def crawler(urls)
    urls.each do |url|
      regex, steam_id_present = regex_determiner(url)
      if steam_id_present
        steam_id = get_steam_id_from_url(url, regex)
        @steam_ids << steam_id
        BackpackRetriever(@hydra, steam_id) # for now
      elsif regex
        crawl url, regex
      else
        @errors << "Bad Url: #{url}"
      end
    end
  end

  def crawl(url, regex)
    @hydra.queue(page_source = Typhoeus::Request.new(url))
    page_source.on_complete do |response|
      if response.success?
        urls = scrape_page_source(response.body, regex)
        crawler urls
      else
        @errors << response.options.to_s
      end
    end
  end

  def get_steam_id_from_url(url, regex)
    scrape_page_source(url, regex).first
  end

  def regex_determiner(url)
    case url
    when /(http\:\/\/\w+\.\w+\.\w+\/tf)/
      return /(http\:\/\/\w+\.\w+\.\w+\/overview\/\d+)/, false
    when /(http\:\/\/\w+\.\w+\.\w+\/overview\/\d+)/
      return /(http\:\/\/\w+\.\w+\.\w+\/playerinfo\/\d+)/, false
    when /(http\:\/\/\w+\.\w+\.\w+\/playerinfo\/\d+)/
      return /http\:\/\/steamcommunity\.com\/profiles\/\d+/, false
    when /http\:\/\/steamcommunity\.com\/profiles\/\d+/
      return /http\:\/\/steamcommunity\.com\/profiles\/(\d+)/, true
    else
      # Bad Url - return nil
    end
  end

  def scrape_page_source(page_source, regex)
    page_source.scan(regex).compact.uniq.flatten
  end

end
