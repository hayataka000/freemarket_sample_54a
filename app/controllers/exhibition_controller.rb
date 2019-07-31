class ExhibitionController < ApplicationController
    def edit
        @user = User.find(params[:id])
        @item = Item.find(params[:id])
      end
end
