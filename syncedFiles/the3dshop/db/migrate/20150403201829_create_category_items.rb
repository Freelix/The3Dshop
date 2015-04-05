class CreateCategoryItems < ActiveRecord::Migration
  def change
    create_table :categories_items do |t|
      t.belongs_to :item, index: true
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
  end
end
