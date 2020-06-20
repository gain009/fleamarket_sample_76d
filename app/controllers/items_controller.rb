class ItemsController < ApplicationController
  require 'payjp'

  before_action :authenticate_user!, only: [:buy_confirmation, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :set_brand
  before_action :set_card, except: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_destination, except: [:index, :new, :create]

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
    
    #カテゴリセレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
      
    end
    flash[:notice] = ""
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
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  def edit
    if current_user.id == @item.user_id
      flash[:notice] = ""
      render :edit
    else
      flash[:notice] = "権限がありません"
      redirect_to item_path(@item)
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      flash[:notice] = "変更に失敗しました"
      render :edit
    end
  end

  def show
    @same_user_items = Item.where(user_id: @item.user_id).order(created_at: "DESC").limit(3)
    @same_category_items = Item.where(category_id: @item.category_id).order(created_at: "DESC").limit(3)
  end

  def destroy
    if current_user.id == @item.user_id && @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(item)
    end
  end

  def buy_confirmation
    @item = Item.find(params[:id])   
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :status_id, :shipping_cost_id, :shipping_method_id, :prefecture_id, :shipping_date_id, :brand_id, :buyer_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_brand
    @brand = Brand.select("name","id")
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_destination
    @destination = Destination.find(current_user.id)
  end



end
