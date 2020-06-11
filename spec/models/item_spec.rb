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
end