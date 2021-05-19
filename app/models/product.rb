class Product < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  has_many_attached :photos
  belongs_to :user
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :photos, presence: true
  validates :city, presence: true
  validates :category, presence: true
end
