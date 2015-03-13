class CreateSubOrders < ActiveRecord::Migration
  def change
    create_table :sub_orders do |t|
      t.references :order
      t.references :good
      t.integer :quantity
      t.decimal :value
      t.timestamps
    end
  end
end
