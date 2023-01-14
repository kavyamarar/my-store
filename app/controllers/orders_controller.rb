class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :new, :create]

  def index
    @orders = @item.orders
  end

  def new
    @order = @item.orders.build 
  end

  def create
    @order = @item.orders.build(order_params)

    if @order.save
      flash[:notice] = "Order succesfully created"
      redirect_to item_orders_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:date, :quantity)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
  
end
