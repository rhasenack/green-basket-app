class RemoveFieldsFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :basket_id
    remove_column :orders, :name
    remove_column :orders, :quantity
    remove_column :orders, :description
  end
end
