class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zipcode
    end
  end
end