class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.references :customer
      t.date :placed_at
      t.string :code
      t.string :state
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :orders, :deleted_at
    add_index :orders, :code
  end

end
