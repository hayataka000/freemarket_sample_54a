class ItemController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC").limit(4)
  end

  def new
    @item = Item.new
  end
  def create
    Item.create(item_params)
    @item.save
  end


  def show
    @item = Item.find(params[:id])
    @user = @item.user
    
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  
  def update
    @item = Item.find(params[:id])
    @item.update(params.require(:item).permit(:name, :image,:price,:size,:condition,:delivery_fee,:delivery_date,:delivery_method,:shipping_area,:content,:category))
    redirect_to item_show_path
  end

  private 
  def item_params
      params.permit(:name, :image,:price,:size,:condition,:delivery_fee,:delivery_date,:delivery_method,:shipping_area,:content,:category)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :size, :condition, :delivery_fee, :delivery_date, :delivery_method, :shipping_area, :content, :category)
  end
  

end

