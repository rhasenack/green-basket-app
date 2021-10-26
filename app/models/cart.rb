class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_baskets
  has_many :baskets, through: :cart_baskets
  validates :user_id, uniqueness: true
end
