class CreateProductEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :product_entries do |t|
      t.string :payment_date
      t.date :forecast_receipt_date
      t.date :receipt_date
      t.integer :amount
      t.decimal :price
      t.string :observation
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :supplier, null: true, foreign_key: true

      t.timestamps
    end
  end
end
