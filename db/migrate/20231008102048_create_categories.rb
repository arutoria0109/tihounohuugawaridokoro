class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories, force: :cascade do |t|

      t.string :name
      t.string :ancestry
      t.index ["ancestry"], name: "index_categories_on_ancestry"
      t.timestamps
    end
  end
end
