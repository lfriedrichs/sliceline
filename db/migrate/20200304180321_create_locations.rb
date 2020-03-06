class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :phone_number
      t.string :address_line
      t.string :city
      t.string :state
      t.string :zipcode
    end
  end
end
