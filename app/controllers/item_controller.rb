class ItemController < ApplicationController
  def index
  end

  def items
  end

  def show
    @user = User.find(params[:id])
    @item = Item.find(params[:id])
  end
end