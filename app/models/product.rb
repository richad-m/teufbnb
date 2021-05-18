class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :photos, presence: true#, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/webp'], size_range: 0..10.5.megabytes }
  # content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
