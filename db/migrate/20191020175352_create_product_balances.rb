class CreateProductBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :product_balances do |t|
      t.integer :amount
      t.references :product_entry, null: true, foreign_key: true
      t.references :product_exit, null: true, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
