class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
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
  validates :user_id, presence: true

  has_many :images
  belongs_to :user
  belongs_to :category
end
