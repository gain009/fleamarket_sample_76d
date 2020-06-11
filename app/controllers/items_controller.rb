class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:buy_confirmation, :edit, :destroy]


  def index
    @items = Item.includes(:images).order('created_at DESC').limit(3)
    @item_brands = Item.includes(:images).order('brand_id DESC').limit(3)
  end

  def new
    @item = Item.new
    @item.images.new

    #カテゴリセレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end


  def create
    @item = Item.new(item_params)
    @item.buyer_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      @item = Item.new
      @item.images.new
      flash[:notice] = "画像は一枚以上入れて下さい"
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
  end


  
  private

  def item_params
    
    params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :status_id, :shipping_cost_id, :shipping_method_id, :prefecture_id, :shipping_date_id, :brand_id, :buyer_id,  images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
