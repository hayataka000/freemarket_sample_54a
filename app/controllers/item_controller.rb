class ItemController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC").limit(4)
  end

  def items
  end
  
  def create
  end
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end
  
  def new
    @item = Item.new
  end
end
