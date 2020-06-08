class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  validates :destination_family_name, presence: true
  validates :destination_first_name, presence: true
  validates :destination_family_name_kana, presence: true
  validates :destination_first_name_kana, presence: true
  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
