class UserController < ApplicationController

    def index
       
    end
    def new
        @users = User.new
    end


end
