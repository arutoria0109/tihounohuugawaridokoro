class AddCategoryToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :category, :string
  end
end
