class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|

      t.string :prefecture#, null: false        #県名カラム
      t.string :description
      t.string :nearest_station   #最寄り駅カラム
      t.string :name#, null: false
      t.integer :category_id
      t.timestamps


    end
  end
end
