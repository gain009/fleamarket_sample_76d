class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_date

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :status_id, presence: true
  validates :size_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_method_id, presence: true
  validates :shipping_date_id, presence: true
  validates :prefecture_id, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

  has_many :images
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true
end
