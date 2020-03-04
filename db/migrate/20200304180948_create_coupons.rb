class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :description
      t.float :discount
      t.datetime :expiration_date
    end
  end
end
