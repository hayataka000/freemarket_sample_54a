class UserController < ApplicationController

    def index
       
    end
    def new
      @user = User.find(params[:id])
    end   
    def set_user
        @user = User.find(params[:id])
        @users = User.all
    end


end
