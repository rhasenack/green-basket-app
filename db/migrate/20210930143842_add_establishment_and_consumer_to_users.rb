class AddEstablishmentAndConsumerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :establishment, :boolean
    add_column :users, :consumer, :boolean
  end
end
