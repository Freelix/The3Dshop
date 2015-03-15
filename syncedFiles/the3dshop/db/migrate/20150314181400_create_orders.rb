class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 6, scale: 2
      t.decimal :tax, precision: 6, scale: 2
      t.decimal :shipping, precision: 6, scale: 2
      t.decimal :total, precision: 6, scale: 2
      t.references :order_status, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :order_statuses
  end
end
