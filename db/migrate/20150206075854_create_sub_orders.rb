class CreateSubOrders < ActiveRecord::Migration
  def change
    create_table :sub_orders do |t|
      t.references :order
      t.references :product
      t.integer :quantity
      t.decimal :value
      t.timestamps
    end
  end
end
