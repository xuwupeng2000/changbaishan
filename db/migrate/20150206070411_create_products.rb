class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user
      t.references :product_category
      t.string :name
      t.text :description
      t.decimal :weight
      t.decimal  "purchase_price"
      t.decimal  "selling_price"
      t.boolean :is_public , default: false
      t.string :state
      t.datetime :deleted_at
      t.timestamps

    end

    add_index :products, :deleted_at
    add_index :products, :name
  end
end
