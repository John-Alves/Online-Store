class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :comission
      t.references :category, null: true, foreign_key: true
      t.references :subcategory, null: true, foreign_key: true

      t.timestamps
    end
  end
end
