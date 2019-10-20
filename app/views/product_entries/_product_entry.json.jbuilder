json.extract! product_entry, :id, :payment_date, :forecast_receipt_date, :receipt_date, :amount, :price, :observation, :product_id, :supplier_id, :created_at, :updated_at
json.url product_entry_url(product_entry, format: :json)
