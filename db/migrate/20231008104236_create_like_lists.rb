class CreateLikeLists < ActiveRecord::Migration[6.1]
  def change
    create_table :like_lists do |t|

      t.integer :members_id#, null: false
      t.integer :stores_id#, null: false
      t.string :comment#, null: false

      t.timestamps
    end
  end
end
