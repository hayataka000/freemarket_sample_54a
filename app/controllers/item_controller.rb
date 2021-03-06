class ItemController < ApplicationController
before_action :set_item ,only: [:edit,:update,:destroy,:show]
skip_before_action :authenticate_user!, only: [:show,:index]

  def index
    @mens = Item.where(category_id: 1, status: 0).order("created_at DESC").limit(4)
    @ladies = Item.where(category_id: 2, status: 0).order("created_at DESC").limit(4)
    @kids = Item.where(category_id: 3, status: 0).order("created_at DESC").limit(4)
    @kosume = Item.where(category_id: 4, status: 0).order("created_at DESC").limit(4)
    @chanel = Item.where(category_id: 5, status: 0).order("created_at DESC").limit(4)
    @vuitton = Item.where(category_id: 6, status: 0).order("created_at DESC").limit(4)
    @supreme = Item.where(category_id: 7, status: 0).order("created_at DESC").limit(4)
    @nike = Item.where(category_id: 8, status: 0).order("created_at DESC").limit(4)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = Rails.application.credentials.dig(:PAYJP_SECRET_KEY)
    charge = Payjp::Charge.create(
    :amount => @item.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    @item.status = "購入済み"
    @item.save
  end

  def update

    redirect_to root_path if @item.user_id != current_user.id
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = @item.user
    @items = Item.where(user_id: @user.id).limit(6).where.not(id: @item.id )
  end

  private 

  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:category_id,:image, :prefecture_id, :delivery_fee_id, :name,  :price, :size, :condition, :delivery_fee_id, :delivery_date, :delivery_method, :content, :category).merge(user_id: current_user.id)
  end
end