require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.new(user_id: User.last.id) }
  it 'requires a user_id' do
    expect(cart).to be_valid
  end

  it 'allows only one cart per user' do
    cart.save
    cart_2 = Cart.new(user_id: User.last.id)
    expect(cart_2).not_to be_valid
  end
end
