class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :brand
  belongs_to_active_hash :size
  belongs_to_active_hash :status


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
  validates :images, presence: true

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :likes, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end


end
