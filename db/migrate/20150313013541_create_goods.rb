class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.references :user
      t.references :product
      t.references :upstream
      t.decimal :purchase_price
      t.decimal :selling_price
    end
  end
end
