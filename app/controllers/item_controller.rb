class ItemController <Item:: ApplicationController
before_action :set_item ,only: [:edit,:update]
before_action :authenticate_user!,except: [:show,:index]
  def set_item
    @item = Item.find(params[:id])
  end


  def index
    @mens = Item.where(category_id: 1).order("created_at DESC").limit(4)
    @ladies = Item.where(category_id: 2).order("created_at DESC").limit(4)
    @kids = Item.where(category_id: 3).order("created_at DESC").limit(4)
    @kosume = Item.where(category_id: 4).order("created_at DESC").limit(4)
    @chanel = Item.where(category_id: 5).order("created_at DESC").limit(4)
    @vuitton = Item.where(category_id: 6).order("created_at DESC").limit(4)
    @supreme = Item.where(category_id: 7).order("created_at DESC").limit(4)
    @nike = Item.where(category_id: 8).order("created_at DESC").limit(4)
    

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
    @item = Item.find(params[:id])
  end
  
  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
    end
  end

  def pay
    Payjp.api_key = 'sk_test_9d1fbd9003b1e3df4725c6fb'
    charge = Payjp::Charge.create(
    :amount => @item.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @items = Item.where(user_id: @user.id).limit(6).where.not(id: @item.id )
  end

  private 
  
  def item_params
    params.require(:item).permit(:category_id,:image, :prefecture_id, :delivery_fee_id, :name,  :price, :size, :condition, :delivery_fee_id, :delivery_date, :delivery_method, :content, :category).merge(user_id: current_user.id)
  end
end

