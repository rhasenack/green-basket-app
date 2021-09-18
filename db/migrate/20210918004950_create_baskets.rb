class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.string :name
      t.time :pickup_min
      t.time :pickup_max
      t.integer :price
      t.text :description
      t.integer :stock
      t.references :restaurant

      t.timestamps
    end
  end
end
