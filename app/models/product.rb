class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :images, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
