class Basket < ApplicationRecord
  has_many :tags
  has_many :orders
  belongs_to :restaurant
end
