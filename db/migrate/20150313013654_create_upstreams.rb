class CreateUpstreams < ActiveRecord::Migration
  def change
    create_table :upstreams do |t|
      t.references :user
      t.string :name
      t.string :address
      t.text :description
    end
  end
end
