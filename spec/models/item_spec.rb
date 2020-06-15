require 'rails_helper'
describe Item do
  describe '#create' do
    it "全ての必須項目が入力されている場合出品できる" do
      user = create(:user)
      category = create(:category)
      brand = create(:brand)
      item = FactoryBot.build(:item, user_id: user[:id], category_id: category[:id], brand_id: brand[:id])
      expect(item).to be_valid
    end
  end

  describe '#update' do
    describe 'validation' do
      describe 'presence true' do
        before do
          @user = create(:user)
          @category = create(:category)
          @brand = create(:brand)
          @item = build(:item, user_id: @user[:id], category_id: @category[:id], brand_id: @brand[:id])
        end
        context '保存に成功する場合' do
          it 'nameカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'peiceカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'descriptionカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'status_idカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'size_idカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'shipping_cost_idカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'shipping_method_idカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'shipping_date_idカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'prefecture_idカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'category_idカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'user_idカラムにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
          it 'imagesにデータがあると保存できること' do
            @item.valid?
            expect(@item).to be_valid
          end
        end
        context '保存に失敗する場合' do
          it 'nameカラムが空だと保存できないこと' do
            @item.name = ""
            @item.valid?
            expect(@item.errors[:name]).to include("can't be blank")
          end
          it 'peiceカラムが空だと保存できないこと' do
            @item.price = ""
            @item.valid?
            expect(@item.errors[:price]).to include("can't be blank")
          end
          it 'descriptionカラムが空だと保存できないこと' do
            @item.description = ""
            @item.valid?
            expect(@item.errors[:description]).to include("can't be blank")
          end
          it 'status_idカラムが空だと保存できないこと' do
            @item.status_id = ""
            @item.valid?
            expect(@item.errors[:status_id]).to include("can't be blank")
          end
          it 'size_idカラムが空だと保存できないこと' do
            @item.size_id = ""
            @item.valid?
            expect(@item.errors[:size_id]).to include("can't be blank")
          end
          it 'shipping_cost_idカラムが空だと保存できないこと' do
            @item.shipping_cost_id = ""
            @item.valid?
            expect(@item.errors[:shipping_cost_id]).to include("can't be blank")
          end
          it 'shipping_method_idカラムが空だと保存できないこと' do
            @item.shipping_method_id = ""
            @item.valid?
            expect(@item.errors[:shipping_method_id]).to include("can't be blank")
          end
          it 'shipping_date_idカラムが空だと保存できないこと' do
            @item.shipping_date_id = ""
            @item.valid?
            expect(@item.errors[:shipping_date_id]).to include("can't be blank")
          end
          it 'prefecture_idカラムが空だと保存できないこと' do
            @item.prefecture_id = ""
            @item.valid?
            expect(@item.errors[:prefecture_id]).to include("can't be blank")
          end
          it 'category_idカラムが空だと保存できないこと' do
            @item.category_id = ""
            @item.valid?
            expect(@item.errors[:category_id]).to include("can't be blank")
          end
          it 'user_idカラムが空だと保存できないこと' do
            @item.user_id = ""
            @item.valid?
            expect(@item.errors[:user_id]).to include("can't be blank")
          end
          it 'imagesが空だと保存できないこと' do
            @item.images.clear
            @item.valid?
            expect(@item.errors[:images]).to include("can't be blank")
          end
        end
      end
    end
  end
end