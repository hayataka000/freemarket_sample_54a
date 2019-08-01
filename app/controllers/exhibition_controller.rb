class ExhibitionController < ApplicationController
    def edit
        @item = Item.find(params[:id])
        @user = @item.user
    end
end
