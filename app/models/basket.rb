class Basket < ApplicationRecord
  has_many :basket_tags
  has_many :tags, through: :basket_tags

  has_many :orders_baskets
  has_many :orders, through: :orders_baskets
  has_many :cart_baskets
  has_many :carts, through: :cart_baskets
  belongs_to :restaurant

  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 20 }
end
