class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.references :basket
      t.integer :quantity
      t.string :name
      t.text :description
      t.integer :price
      t.datetime :date

      t.timestamps
    end
  end
end
