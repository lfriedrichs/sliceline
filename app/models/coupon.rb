class Coupon < ApplicationRecord
    has_many :coupon_items
    has_many :items, through: :coupon_items
end
  