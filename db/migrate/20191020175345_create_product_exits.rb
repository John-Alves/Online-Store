class CreateProductExits < ActiveRecord::Migration[6.0]
  def change
    create_table :product_exits do |t|
      t.integer :amount
      t.decimal :price
      t.string :observation
      t.decimal :comission
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :seller, null: true, foreign_key: true

      t.timestamps
    end
  end
end
