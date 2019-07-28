class ItemController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC").limit(4)
  end

  def new
    @item = Item.new
  end
  def create
      @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
  end
end

  private 
  
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end
  
  def item_params
    params.require(:item).permit(:image,:prefecture_id,:delivery_fee_id,:name,  :price, :size, :condition, :delivery_fee_id, :delivery_date, :delivery_method, :content, :category).merge(user_id: current_user.id)
  end
end

