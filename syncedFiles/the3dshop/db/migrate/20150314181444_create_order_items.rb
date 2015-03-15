class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :item, index: true
      t.references :order, index: true
      t.decimal :unit_price, precision: 6, scale: 2
      t.decimal :total_price, precision: 6, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :order_items, :items
    add_foreign_key :order_items, :orders
  end
end
