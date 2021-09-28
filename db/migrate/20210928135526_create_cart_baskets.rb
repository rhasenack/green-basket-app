class CreateCartBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_baskets do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
