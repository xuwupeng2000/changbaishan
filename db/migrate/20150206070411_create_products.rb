class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user
      t.references :product_category
      t.string :name
      t.text :description
      t.decimal :weight
      t.boolean :is_public , default: false
      t.timestamps
    end
  end
end
