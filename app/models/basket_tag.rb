class BasketTag < ApplicationRecord
  belongs_to :tag
  belongs_to :basket
end
