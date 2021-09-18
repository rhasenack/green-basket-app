class Restaurant < ApplicationRecord
  has_many :baskets
  has_many :orders, through: :baskets
  belongs_to :user
end
