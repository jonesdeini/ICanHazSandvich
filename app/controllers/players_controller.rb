class PlayersController < ApplicationController
require 'xxl_scraper'

  def index
    @players = Player.all
  end 

  def create
    XxlScraper.scrape
    render :index
  end

end
