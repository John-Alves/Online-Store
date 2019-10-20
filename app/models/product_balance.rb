class ProductBalance < ApplicationRecord
  belongs_to :product_entry
  belongs_to :product_exit
  belongs_to :product
end
