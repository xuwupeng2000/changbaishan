class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.references :order
      t.string :name
      # Do not use type, it is magic column in RoR
      t.string :kind
      t.decimal :cost
      t.string :address
      t.string :state
      t.string :code
      t.timestamps

    end
    add_index :deliverables, :address
    add_index :deliverables, :name
    add_index :deliverables, :code
  end
end
