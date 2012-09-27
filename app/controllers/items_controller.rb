class ItemsController < ApplicationController

  def index
    @items = BaseItem.all
  end

  def show
    @item = BaseItem.find params[:id]
    @players = @item.players.sort{ |x,y| y.updated_at <=> x.updated_at }

    #@players = @item.players.sort_by { |player| player.inventories.count }
  end

end
