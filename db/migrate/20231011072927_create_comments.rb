class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :store_id
      t.text :comment
      t.integer :member_id

      t.timestamps
    end
  end
end
