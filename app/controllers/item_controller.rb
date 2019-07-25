class ItemController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC").limit(4)
  end

  def items
  end
  
  def create
     Item.create(item_params)
  end

  private
  def item_params
    params.permit(:name, :iamge, :price, :size, :condition, :delivery_fee, :delivery_fee, :delivery_date, :delivery_method, :shipping_area, :content)
  end
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end
  
  def new
    @item = Item.new
  end
end
