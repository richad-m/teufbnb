class User < ApplicationRecord
  has_many :products
  has_many :bookings, :through => :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
end

