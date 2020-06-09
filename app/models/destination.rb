class Destination < ApplicationRecord
  validates :destination_family_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角のみ使えます" }
  validates :destination_first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角のみ使えます" }
  validates :destination_family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみ使えます" }
  validates :destination_first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみ使えます" }
  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true

  belongs_to :user, optional: true
end
