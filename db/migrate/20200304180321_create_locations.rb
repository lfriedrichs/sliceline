class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.float :food_tax
      t.float :alcohol_tax
      t.float :delivery_fee
    end
  end
end
