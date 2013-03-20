class ItemsController < ApplicationController

  before_filter :require_authentication

  def index
    @items = BaseItem.all.sort_by &:name
  end

  def show
    @item = BaseItem.find params[:id]

    # FIXME BRO TODO NOTE make hide default to false. dont be lazy
    @players = @item.players.where(hide: nil).sort_scope params[:sort]
    @players.reverse! unless params[:direction] == "asc"
  end

end
