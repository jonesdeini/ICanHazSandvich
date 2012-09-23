class PlayersController < ApplicationController

  def index
    @players = Player.all
  end 

  def create
    XxlScraper.scrape
    render :index
  end

  def hide
    player = Player.find params[:id]
    player.hide = true
    player.save
    redirect_to :back
  end

end
