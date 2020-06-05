class Image < ApplicationRecord
  validates :image, presence: true
  validates :item_id, presence: true

  belongs_to :item
end
