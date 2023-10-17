class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|

      t.string :description
      t.string :nearest_station   #最寄り駅カラム
      t.string :name#, null: false
      t.integer :category_id
      t.integer :store_category_id
      t.integer :member_id
      t.integer :parent_id
      t.integer :children_id
      t.integer :grandchildren_id
      t.timestamps


    end
  end
end
