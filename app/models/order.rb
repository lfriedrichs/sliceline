class Order < ApplicationRecord
    belongs_to :user
    belongs_to :location
    has_many :carts
    has_many :items, through: :carts
end
  