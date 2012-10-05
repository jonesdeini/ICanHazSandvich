class ItemsController < ApplicationController

  def index
    @items = BaseItem.all
  end

  def show
    @item = BaseItem.find params[:id]

    @players = @item.players.sort_scope params[:sort]
  end

end
