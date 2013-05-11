class SearchesController < ApplicationController

  before_filter :require_authentication

  def create
    @clans = params[:clans] || [""]
    @crawlers = []
    if @clans
      @clans.each do |clan|
        crawler = SteamIdFetcher.new clan
        crawler.delay.go!
        @crawlers << crawler
      end
    end
  end

  def new
    @clans = %w(
              http://db.gameme.com/tf
              http://stats.hyperiongaming.org/tf
              http://intoxgaming.gameme.com/tf
              http://sourceop.gameme.com/tf
              http://monthly.topnotchclan.com/tf
              http://xxlgamers.gameme.com/tf
    )
  end

end
