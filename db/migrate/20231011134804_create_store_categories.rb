class CreateStoreCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :store_categories do |t|
      t.integer :store_id
      t.integer :category_id
    end
  end
end
