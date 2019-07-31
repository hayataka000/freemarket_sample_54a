class ExhibitionController < ApplicationController
    def edit
      @item = Item.find(params[:id])
    end
end
