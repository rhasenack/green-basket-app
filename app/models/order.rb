class Order < ApplicationRecord
  belongs_to :user
  has_many :baskets, through: :orders_baskets
end
