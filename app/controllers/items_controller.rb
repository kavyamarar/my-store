class ItemsController < ApplicationController

  def index
    @items = Item.order_by_name
  end

  def new
    @item = Item.new
  end

end
