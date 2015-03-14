class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.references :customer
      t.date :placed_at
      t.string :code
      t.string :state
      t.timestamps
    end
  end
end
