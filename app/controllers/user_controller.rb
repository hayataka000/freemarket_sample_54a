class UserController < ApplicationController

    def index
       
    end
    def new
        @users = User.all
    end


end
