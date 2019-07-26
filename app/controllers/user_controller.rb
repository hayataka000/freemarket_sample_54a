class UserController < ApplicationController
  before_action :set_user
    def index
       
    end
    def new
    end
    
    def set_user
        @user = User.find(params[:id])
      end
end
