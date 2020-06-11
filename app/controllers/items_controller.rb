class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    # @item.update( buyer_id: user.id)
    if @item.save
      redirect_to root_path
    else
      @item = Item.new
      @item.images.new
      flash[:notice] = "画像は一枚以上入れて下さい"
      render :new
    end
  end




  def show
  end

  def buy_confirmation
  end








  
  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :status_id, :shipping_cost_id, :shipping_method_id, :prefecture_id, :shipping_date_id, :brand_id, :user_id,  images_attributes: [:image, :_destroy, :id])
  end
end
