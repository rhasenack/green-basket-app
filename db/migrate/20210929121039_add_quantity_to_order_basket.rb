class AddQuantityToOrderBasket < ActiveRecord::Migration[6.0]
  def change
    add_column :orders_baskets, :quantity, :integer
  end
end
