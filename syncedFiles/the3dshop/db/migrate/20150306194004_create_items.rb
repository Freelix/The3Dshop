class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user
      t.string :name
      t.string :price
      t.text :description
      t.text :preview_description
      t.date :published
      t.attachment :image

      t.timestamps null: false
    end
  end
end
