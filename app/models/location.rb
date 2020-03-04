class Location < ApplicationRecord
    has_many :menus
    has_many :items, through: :menus
    has_many :orders
    has_many :users, through: :orders
end
  