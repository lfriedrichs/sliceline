class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :order_number
      t.integer :location_id
      t.string :status
      t.string :type
      t.integer :sub_total_price
      t.integer :tax
      t.integer :delivery_fee
      t.integer :tip
      t.integer :total_price
      t.string :payment_method
      t.timestamps
    end
  end
end
