class CouponItem < ApplicationRecord
    belongs_to :coupon 
    belongs_to :item 
end
  