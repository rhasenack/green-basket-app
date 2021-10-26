require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { Order.new(user_id: User.last.id, date: Time.now.to_date, price: 10) }
  it 'is valid with a user, price and a date' do
    expect(order).to be_valid
  end
  it 'has the status `paced` when is created' do
    order.save
    expect(Order.last.status).to eq('placed')
  end
  it 'is not valid without a price or without a date' do
    price = order.price
    order.price = nil
    expect(order).not_to be_valid

    order.price = price
    order.date = nil
    expect(order).not_to be_valid
    order.date = Time.now.to_date
  end

  it 'can only exist one order per user per date' do
    order.save
    order2 = Order.new(user_id: User.last.id, date: Time.now.to_date, price: 20)
    expect(order2).not_to be_valid
  end


end
