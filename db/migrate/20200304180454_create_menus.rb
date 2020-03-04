class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.integer :location_id
      t.integer :item_id
    end
  end
end
