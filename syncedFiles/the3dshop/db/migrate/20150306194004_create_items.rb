class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user
      t.string :name
      t.decimal :price, precision: 6, scale: 2
      t.text :description
      t.text :preview_description
      t.date :published
      t.attachment :image

      t.timestamps null: false
    end
  end
end
