class ItemsController < ApplicationController

  before_action :load_item, only: [:show, :edit, :destroy, :update]

  def index
    @items = Item.order_by_name
  end

  def new
    @item = Item.new
  end

  def show
   @orders = @item.orders
  end
+

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item succesfully created"
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
   
  end

  def update
    if @item.update(item_params)
      redirect_to action: :index
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @item.destroy
    flash[:notice] = "Item succesfully deleted"
    redirect_to action: :index
  end
 
  private
    def item_params
      params.require(:item).permit(:name, :rate, :quantity)
    end

    def load_item
      @item = Item.find(params[:id])
    end

end
