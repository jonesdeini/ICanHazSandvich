class ItemsController < ApplicationController

  before_filter :require_authentication

  def index
    @items = BaseItem.all.sort_by &:name
  end

  def show
    @item = BaseItem.find params[:id]
    @item.new_players_count = 0
    @item.save

    @players = @item.players.where(hide: false).sort_scope params[:sort]
    @players.reverse! unless params[:direction] == "asc"
  end

end
