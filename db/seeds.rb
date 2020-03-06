# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.destroy_all
Item.destroy_all
User.destroy_all

50.times do 
    item = Item.create(name: Faker::Food.dish, description: Faker::Food.description, price:Faker::Number.decimal(l_digits: 2))
end 
5.times do 
    location = Location.create(name: Faker::Restaurant.name, phone_number:Faker::PhoneNumber.phone_number, address_line: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state, zipcode: Faker::Address.zip_code)
    10.times do
        location.items << Item.all.sample
    end
end
10.times do 
    User.create(user_name:Faker::Internet.username, password:"password", first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, email:Faker::Internet.email, phone_number:Faker::PhoneNumber.phone_number, address_line_1:Faker::Address.street_address, address_line_2:Faker::Address.secondary_address, city:Faker::Address.city, state:Faker::Address.state, zipcode:Faker::Address.zip_code)
end