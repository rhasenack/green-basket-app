require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { Restaurant.new(name: 'Restaurant Test', address: 'Rua do amial 15, Porto, Portugal', user_id: User.last.id) }
  it 'is valid with a name, address and user_id' do
    expect(restaurant).to be_valid
  end

  it 'geocodes the city, country, latitude and longitude when given a valid address' do
    restaurant.save!
    saved_restaurant = Restaurant.last
    expect(restaurant.latitude).to be_truthy
    expect(restaurant.longitude).to be_truthy
    expect(restaurant.city).to be_truthy
    expect(restaurant.country).to be_truthy
  end

  it 'is invalid if there is no name' do
    restaurant.name = nil
    expect(restaurant).not_to be_valid
  end

  it 'is invalid if there is no address' do
    restaurant.address = nil
    expect(restaurant).not_to be_valid
  end

  it 'is invalid if there is no user_id' do
    restaurant.user_id = nil
    expect(restaurant).not_to be_valid
  end
end
