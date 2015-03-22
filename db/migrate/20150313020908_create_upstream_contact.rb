class CreateUpstreamContact < ActiveRecord::Migration
  def change
    create_table :upstream_contacts do |t|
      t.references :upstream
      t.string :name
      t.string :detail
    end
  end
end
