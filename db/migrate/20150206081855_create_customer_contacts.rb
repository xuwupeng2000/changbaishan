class CreateCustomerContacts < ActiveRecord::Migration
  def change
    create_table :customer_contacts do |t|
      t.references :customer
      t.string :name
      t.string :detail

      t.timestamps
    end
  end
end
