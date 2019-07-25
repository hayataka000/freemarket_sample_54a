class ItemController < ApplicationController
  def index
  end

  def items
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end
end