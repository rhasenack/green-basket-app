class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_baskets, dependent: :destroy
  has_many :baskets, through: :orders_baskets
end
