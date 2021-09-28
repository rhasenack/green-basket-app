class AddQuantityToCartBaskets < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_baskets, :quantity, :integer
  end
end
