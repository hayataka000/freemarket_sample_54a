class ProductPurchaseConfirmationController < ApplicationController
  def edit
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
