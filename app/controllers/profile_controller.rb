class ProfileController < ApplicationController
  def index
    @items = Item.all
  end
end
