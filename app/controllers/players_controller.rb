class PlayersController < ApplicationController

  before_filter :require_authentication

  def index
    @players = Player.all
  end

  def hide
    player = Player.find params[:id]
    player.hide = true
    player.save
    redirect_to :back
  end

  def traded
    player = Player.find params[:id]
    player.traded = true
    player.save
    redirect_to :back
  end

end
