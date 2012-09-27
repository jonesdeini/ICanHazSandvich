class ItemsController < ApplicationController

  def index
    @items = BaseItem.all
  end

  def show
    @item = BaseItem.find params[:id]
    if params[:sort] == "inv_count"
      @players = @item.players.sort_by { |player| player.inventories.count }
    elsif params[:sort] ==  "updated_at"
      @players = @item.players.sort{ |x,y| y.updated_at <=> x.updated_at }
    else
      @players = @item.players.sort{ |x,y| y.updated_at <=> x.updated_at }
    end
  end

end
