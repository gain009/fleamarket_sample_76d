class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:buy_confirmation, :edit, :destroy]

  def index
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
