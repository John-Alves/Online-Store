json.extract! product, :id, :title, :description, :comission, :category_id, :subcategory_id, :created_at, :updated_at
json.url product_url(product, format: :json)
