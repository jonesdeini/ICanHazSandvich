class ItemsController < ApplicationController

  def index
    @items = BaseItem.all
  end

  def show
    @item = BaseItem.find params[:id]
  end

end
