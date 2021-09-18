class OrdersBasket < ApplicationRecord
  belongs_to :order
  belongs_to :basket
end
