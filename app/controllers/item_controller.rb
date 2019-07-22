class ItemController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @item = item.find(params[:id])
  end

end

