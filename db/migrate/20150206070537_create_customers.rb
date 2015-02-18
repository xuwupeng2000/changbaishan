class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :user
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
