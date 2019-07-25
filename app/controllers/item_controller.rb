class ItemController < ApplicationController
  def index
  end

  def items
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end
end