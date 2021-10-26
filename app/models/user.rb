class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validate :consumer_or_restaurant

  private

  def consumer_or_restaurant
    if consumer && establishment
      errors.add(:establishment, "pode ser estabelecimento e consumidor ao mesmo tempo")
      return false
    end

    unless consumer || establishment
      errors.add(:establishment, "Precisa ser estabelecimento ou consumidor")
      return false
    end
  end
end
