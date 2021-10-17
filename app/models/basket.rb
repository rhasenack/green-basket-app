class Basket < ApplicationRecord
  has_one_attached :photo
  has_many :basket_tags
  has_many :tags, through: :basket_tags

  has_many :orders_baskets
  has_many :orders, through: :orders_baskets
  has_many :cart_baskets
  has_many :carts, through: :cart_baskets
  belongs_to :restaurant

  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 20 }
  validate :pickup_max_bigger_than_min, on: :create

  def pickup_max_bigger_than_min
    if pickup_max <= pickup_min
      errors.add(:pickup_max, "Pickup Max has to be bigger than Picku Min")
    end
  end
end
