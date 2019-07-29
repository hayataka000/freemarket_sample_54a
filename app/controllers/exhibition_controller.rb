class ExhibitionController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end
  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
    end
  end
end
