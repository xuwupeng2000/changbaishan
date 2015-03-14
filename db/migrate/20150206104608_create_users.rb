class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :age
      t.string :email
      t.string :state

      t.timestamps
    end
  end
end
