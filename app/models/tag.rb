class Tag < ApplicationRecord
  has_many :baskets, through: :basket_tag
  validates :name, presence: true
end
