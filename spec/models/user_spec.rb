require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.new(email: 'a@a.com', password:'123456', encrypted_password: '123456', establishment: 1) }
  it 'is valid with an email, password, encrypted password, establishment/consumer' do
    expect(user).to be_valid
  end
  it 'is invalid withou an email' do
    email = user.email
    user.email = nil
    expect(user).not_to be_valid
    user.email = email
  end
  it 'is invalid without a password' do
    pwd = user.password
    user.password = nil
    expect(user).not_to be_valid
    user.password = pwd
  end

  it 'is invalid without having establishment = true or consumer = true' do
    user.establishment = 0
    user.consumer = 0
    expect(user).not_to be_valid
  end
  it 'is invalid with both establishment and consumer set to true' do
    user.establishment = 1
    user.consumer = 1
    expect(user).not_to be_valid
  end
end
