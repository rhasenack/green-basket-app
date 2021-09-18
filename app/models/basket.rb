class Basket < ApplicationRecord
  has_many :tags
  has_many :orders, through: :orders_baskets
  belongs_to :restaurant

  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 20 }
end
