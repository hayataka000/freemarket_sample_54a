class ItemController < ApplicationController
  def index
  end


  def items
  end

  def show
    @user = User.find(1)
    binding.pry
  end
end
