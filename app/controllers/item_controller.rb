class ItemController < ApplicationController
  def index
  end


  def items
  end

  def show
    @user = User.find(1)
    @item = Item.find(1)
  end
end
