class Restaurant < ApplicationRecord
  has_many :baskets
  has_many :orders, through: :baskets
  belongs_to :user
  validates :name, length: { minimum: 2 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
