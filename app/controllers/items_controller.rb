class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:buy_confirmation, :edit, :destroy]

  def index
    @items = Item.includes(:images).order('created_at DESC').limit(3)
    @item_brands = Item.includes(:images).order('brand_id DESC').limit(3)
  end

  def new
  end




  def show
    @item = Item.find(params[:id])
    @same_user_items = Item.where(user_id: @item.user_id).order(created_at: "DESC").limit(3)
    @same_category_items = Item.where(category_id: @item.category_id).order(created_at: "DESC").limit(3)
  end

  def buy_confirmation
  end
end
