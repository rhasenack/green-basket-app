class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :address

      t.timestamps
    end
  end
end
