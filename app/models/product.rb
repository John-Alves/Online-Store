class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :subcategory, optional: true
end
