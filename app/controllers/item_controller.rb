class ItemController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC").limit(4)
  end

  def new
    @item = Item.new
  end
  def create
     @item = Item.new(item_params)
     @item.save
  end
  private 
  def item_params
      params.permit(:name, :image,:price,:size,:condition,:delivery_fee,:delivery_date,:delivery_method,:shipping_area,:content,:category)
  end


  

  private
  def item_params
    params.require(:item).permit(:name, :iamge, :price, :size, :condition, :delivery_fee, :delivery_date, :delivery_method, :shipping_area, :content, :category)
  end
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end
  
  private 
  def item_params
    params.require(:item).permit(:name, :iamge, :price, :size, :condition, :delivery_fee, :delivery_date, :delivery_method, :shipping_area, :content, :category).merge(user_id: current_user.id)
  end


end

