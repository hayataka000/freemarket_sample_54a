class ExhibitionController < ApplicationController
    def edit

        @item = Item.find(params[:id])
        @user = @item.user
#         @user = User.find(params[:id])
#         @item = Item.find(params[:id])
    end
end
