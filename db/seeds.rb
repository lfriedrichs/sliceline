# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.destroy_all
Item.destroy_all

Location.create(name: "ex", phone_number: "8675309", address_line_1: "address_line_1",
address_line_2: "address_line_2", city: "city", state: "state", zipcode: "01003", 
food_tax: 0.20, alcohol_tax: 0.20, delivery_fee: 4.99)

test = Location.create(name: "name", phone_number: "8675309", address_line_1: "address_line_1",
address_line_2: "address_line_2", city: "city", state: "state", zipcode: "01003", 
food_tax: 0.20, alcohol_tax: 0.20, delivery_fee: 4.99)

item = Item.create(name: "name", description: "this is a dish", price:5.99, tax_type:"food")

test.items << item