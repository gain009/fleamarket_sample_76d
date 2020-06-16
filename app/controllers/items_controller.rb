class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:buy_confirmation, :edit, :destroy]
  before_action :set_brand


  def index
    @items = Item.includes(:images).order('created_at DESC').limit(3)
    @item_brands = Item.includes(:images).order('brand_id DESC').limit(3)
  end

  def new
    unless user_signed_in?
      redirect_to root_path
    end
    @errors = []
    @item = Item.new
    @item.images.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @errors = @item.errors.full_messages
      @item = Item.new
      @item.images.new
      render :new
    end
  end



  def show
    @item = Item.find(params[:id])
    @same_user_items = Item.where(user_id: @item.user_id).order(created_at: "DESC").limit(3)
    @same_category_items = Item.where(category_id: @item.category_id).order(created_at: "DESC").limit(3)
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id && item.destroy
      redirect_to root_path
    else
      redirect_to item_path(item)
    end
  end

  def buy_confirmation
    @item = Item.find(params[:id])
  end


  
  private

  def item_params
    
    params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :status_id, :shipping_cost_id, :shipping_method_id, :prefecture_id, :shipping_date_id, :brand_id, :buyer_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_brand
    @brand = Brand.select("name","id")
  end
end
