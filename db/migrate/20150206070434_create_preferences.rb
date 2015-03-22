class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :customer
      t.decimal :profit_margin
      t.decimal :profit_per_item
      t.string  :state
      t.timestamps
    end
  end
end
