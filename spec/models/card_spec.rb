require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end


describe Card do

  let(:user){create(:user)}
  let(:card){create(:card)}

  describe '#create' do

    it 'customer_idがない時は保存されないこと' do
      card = build(:card, customer_id: nil)
      card.valid?

    end

    it 'card_idがない時は保存されないこと' do
      card = build(:card, card_id: nil)
      card.valid?
    end
    
    it 'user_idがない時は保存されないこと' do
      card = build(:card, user_id: nil)
      card.valid?
    end

    it "customer_idとcard_idとuser_idが存在すれば登録できること" do
      card = build(:card, user_id: user.id )
      expect(card).to be_valid
    end

  end
end