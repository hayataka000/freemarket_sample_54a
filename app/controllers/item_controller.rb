class ItemController < ApplicationController
before_action :set_item ,only: [:edit,:update]

  def set_item
    @item = Item.find(params[:id])
  end


  def index
    @items = Item.includes(:user).order("created_at DESC").limit(4)
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

  # product_purchase_confirmation用のアクションで @item を1件特定しておく
  def product_purchase_confirmation
    @item = Item.find(params[:id])
  end
  def pay
    @item = Item.find(params[:id])
    # params[:id] を使って 商品を特定し、@itemとして定義する
    Payjp.api_key = Rails.application.credentials.dig(:PAYJP_SECRET_KEY)
    charge = Payjp::Charge.create(
    :amount => @item.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end


  def edit
  end


  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
    private 
  
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end
  
  def item_params
    params.require(:item).permit(:image, :prefecture_id, :delivery_fee_id, :name,  :price, :size, :condition, :delivery_fee_id, :delivery_date, :delivery_method, :content, :category).merge(user_id: current_user.id)
  end
end

