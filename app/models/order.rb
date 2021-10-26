class Order < ApplicationRecord
  after_save :set_status

  belongs_to :user
  has_many :orders_baskets, dependent: :destroy
  has_many :baskets, through: :orders_baskets

  validates :user, presence: true
  validates :price, presence: true
  validates :date, presence: true

  validates :user, uniqueness: { scope: :date}

  private

  def set_status
    update_column(:status, 'placed')
  end
end
