class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orders = @item.orders
  end

  def new
    @item = Item.find(params[:item_id])
    @order = @item.orders.build 
  end

  def create
    @item = Item.find(params[:item_id])
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
  
end
