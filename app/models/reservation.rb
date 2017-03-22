class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_products
  has_many :products, through: :reservation_products
end
