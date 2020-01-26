class ProductExit < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :seller, optional: true
end
