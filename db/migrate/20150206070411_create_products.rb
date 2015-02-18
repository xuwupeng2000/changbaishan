class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user
      t.string :name
      t.decimal :cost
      t.text :description
      t.timestamps
    end
  end
end
