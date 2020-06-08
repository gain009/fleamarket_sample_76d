class ItemsController < ApplicationController
  def index
  end




  def show
    @item = Item.find(params[:id])
    @same_user_items = Item.where(user_id: @item.user.id).order(created_at: "DESC").limit(3)
    @same_category_items = Item.where(category_id: @item.category_id).order(created_at: "DESC").limit(3)
  end

  def buy_confirmation
  end
end
