class Product < ApplicationRecord
    belongs_to :admin
    has_many :order_lines
    has_many :customer
end
