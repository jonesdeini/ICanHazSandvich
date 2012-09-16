class ItemsController < ApplicationController

  def index
    @items = BaseItem.all
  end

end
