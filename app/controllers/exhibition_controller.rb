class ExhibitionController < ApplicationController
 
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

end
