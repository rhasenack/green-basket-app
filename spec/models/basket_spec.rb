require 'rails_helper'

RSpec.describe Basket, type: :model do
  # before(:all) do
  #   Rails.application.load_seed
  # end
  let(:basket) {Basket.new(name: 'basketTest', description: 'This is a test basket!!', pickup_min: Time.now, pickup_max:Time.now, restaurant: Restaurant.first)}
  it 'successfully saves with a valid name, description, pickup-min and pickup-max values and restaurant' do
    expect(basket).to be_valid
  end

  it 'doesnt allow a max-pickup-time smaller than min-pickuptime' do
    pickup_min = basket.pickup_min
    basket.pickup_max = pickup_min - 100
    expect(basket).not_to be_valid
  end

  it 'fails to write to db if doesnt have a name or description' do
    name = basket.name
    basket.name = nil
    expect(basket).not_to be_valid

    basket.name = name
    basket.description = nil
    expect(basket).not_to be_valid
  end

  it 'doesnt allow a description with less than 20 characters' do
    basket.description = 'test'
    expect(basket).not_to be_valid
  end
end
