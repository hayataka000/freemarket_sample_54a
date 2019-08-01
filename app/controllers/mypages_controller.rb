class MypagesController < ApplicationController   
  
  def index
        @user = User.find_by(id:params[:id])
      if @user.id != current_user.id
        redirect_to root_path
      else
    end
  end
end
