class Product < ApplicationRecord
  has_many :reservation_products
  has_many :reservations, through: :reservation_products
end
