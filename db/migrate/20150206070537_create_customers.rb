class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :user
      t.string :name
      t.string :address
      t.datetime :deleted_at
      t.timestamps

    end
    add_index :customers, :deleted_at
    add_index :customers, :name
  end
end
