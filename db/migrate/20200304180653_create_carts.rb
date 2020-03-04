class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity
      t.float :item_price
    end
  end
end
