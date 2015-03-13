class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.references :order
      t.decimal :rate
      t.decimal :value
    end
  end
end
