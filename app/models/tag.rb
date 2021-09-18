class Tag < ApplicationRecord
  has_many :baskets, through: :basket_tag
end
