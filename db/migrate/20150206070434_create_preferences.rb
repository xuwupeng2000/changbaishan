class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :customer
      t.decimal :margin
      t.timestamps
    end
  end
end
