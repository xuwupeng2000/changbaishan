class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.references :user
      t.references :product
      t.references :upstream
      t.decimal :purchase_price
      t.decimal :selling_price
      t.datetime :deleted_at

    end
    add_index :goods, :deleted_at
  end
end
