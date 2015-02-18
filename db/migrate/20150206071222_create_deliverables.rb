class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.references :order
      t.decimal :cost
      t.string :address
      t.timestamps
    end
  end
end
