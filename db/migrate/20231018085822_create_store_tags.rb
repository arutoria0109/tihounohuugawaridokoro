class CreateStoreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :store_tags do |t|
      
      #↓新規作成するテーブルのカラムに、もともとあるテーブルを指定する場合
      t.references :store, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    # 同じタグは２回保存出来ない
    add_index :store_tags, [:store_id,:tag_id],unique: true
  end
end
