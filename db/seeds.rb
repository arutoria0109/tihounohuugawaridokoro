# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'aaa@aaa',
   password: 'aaaaaa'
)

stores = Category.create(name: '北海道地方')

stores_prefecture = stores.children.create(name: '北海道')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])


stores = Category.create(name: '東北地方')

stores_prefecture = stores.children.create(name: '青森県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

stores_prefecture = stores.children.create(name: '岩手県')

stores_prefecture.children.create([{ name: '温泉'}, { name: 'カフェ'}, { name: 'お食事処'}, { name: 'レジャー'},{ name: 'ショッピング'}])

