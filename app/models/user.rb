class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validate :consumer_or_restaurant

  private

  def consumer_or_restaurant
    if consumer && establishment
      errors.add([:establishment, :consumer], "Não pode ser estabelecimento e consumidor ao mesmo tempo")
    end
  end
end
