class Image < ApplicationRecord
  validates :image, presence: true
  validates :item_id, presence: true

end
