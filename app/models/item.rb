class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :size, presence: true
  validates :shipping_area, presence: true
  validates :shipping_method, presence: true
  validates :shipping_date, presence: true
  validates :prefecture_id, presence: true
  validates :category_id, presence: true
  validates :brand_id, presence: true
  validates :user_id, presence: true

end
