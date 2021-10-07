class Restaurant < ApplicationRecord
  has_many :baskets
  has_many :orders, through: :baskets
  belongs_to :user
  validates :name, length: { minimum: 2 }

  geocoded_by :address
  after_validation :geocode
  after_validation :reverse_geocode

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city    = geo.city
      obj.country = geo.country_code
    end
  end

end
