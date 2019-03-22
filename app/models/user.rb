class User < ActiveRecord::Base
    has_secure_password
    has_many :foods
    has_many :orders, through: :foods
end