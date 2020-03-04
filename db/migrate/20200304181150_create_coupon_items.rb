class CreateCouponItems < ActiveRecord::Migration[6.0]
  def change
    create_table :coupon_items do |t|
      t.integer :coupon_id
      t.integer :item_id
    end
  end
end
