class User < ApplicationRecord
    has_secure_password
    has_many :orders

    validates :user_name, uniqueness: true
    validates :user_name, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true
    validates :address_line_1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zipcode, presence: true
end
  