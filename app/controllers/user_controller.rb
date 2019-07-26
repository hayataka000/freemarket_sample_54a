class UserController < ApplicationController
  before_action :set_user
    def index
       
    end
    def new
      @user = User.find(params[:id])
      binding.pry
    end
    
    def set_user
        @user = User.find(params[:id])
        binding.pry
      end
end
