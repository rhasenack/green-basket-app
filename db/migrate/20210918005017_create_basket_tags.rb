class CreateBasketTags < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
