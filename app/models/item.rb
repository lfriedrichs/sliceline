class Item < ApplicationRecord
    has_many :coupon_items
    has_many :menus
    has_many :locations, through: :menus
end
  