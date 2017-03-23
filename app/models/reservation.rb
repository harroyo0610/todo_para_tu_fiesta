class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_products
  has_many :products, through: :reservation_products
  validates :name, presence: true	
  validates :address, presence: true	
  validates :date, presence: true	
  validates :time, presence: true	
  validates :phone, presence: true	
end
