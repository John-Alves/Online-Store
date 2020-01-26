class ProductEntry < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :supplier, optional: true
end
