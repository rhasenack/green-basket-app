class Basket < ApplicationRecord
  has_many :tags
  has_many :orders, through: :orders_baskets
  belongs_to :restaurant
end
