class ItemsController < ApplicationController
  def index
    @items = Item.all
  end




  def show
  end

  def buy_confirmation
  end
end
