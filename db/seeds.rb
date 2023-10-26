# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'aaa@aaa',
   password: 'seiga19'
)

stores = Category.create(name: '北海道地方')

stores_prefecture = stores.children.create(name: '北海道')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '東北地方')

stores_prefecture = stores.children.create(name: '青森県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '岩手県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '宮城県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '秋田県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '山形県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '福島県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '関東地方')

stores_prefecture = stores.children.create(name: '茨城県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '栃木県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '群馬県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '埼玉県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '千葉県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '東京都')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '神奈川県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '北陸・甲信越地方')

stores_prefecture = stores.children.create(name: '新潟県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '富山県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '石川県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '福井県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '山梨県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '長野県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '東海地方')

stores_prefecture = stores.children.create(name: '岐阜県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '静岡県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '愛知県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '三重県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '関西地方')

stores_prefecture = stores.children.create(name: '滋賀県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '京都府')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '大阪府')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '兵庫県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '奈良県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '和歌山県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '中国地方')

stores_prefecture = stores.children.create(name: '鳥取県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '島根県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '岡山県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '広島県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '山口県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '四国地方')

stores_prefecture = stores.children.create(name: '徳島県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '香川県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '愛媛県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '高知県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '九州地方')

stores_prefecture = stores.children.create(name: '福岡県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '佐賀県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '長崎県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '熊本県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '大分県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '宮崎県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '鹿児島県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '沖縄県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

