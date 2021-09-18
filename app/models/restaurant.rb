class Restaurant < ApplicationRecord
  has_many :baskets
  belongs_to :user
end
