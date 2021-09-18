class CreateOrdersBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_baskets do |t|
      t.references :order, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
