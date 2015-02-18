class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :customer

      t.string :name
      t.string :string

      t.timestamps
    end
  end
end
