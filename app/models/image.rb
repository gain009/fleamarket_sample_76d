class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :item
  validates_presence_of :image
end
