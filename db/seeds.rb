# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Business.destroy_all
# Category.destroy_all
# SubCategory.destroy_all
# User.destroy_all

User.create! email: 'player@one.com', password: 123456, admin: true
User.create! email: 'player@two.com', password: 123456
User.create! email: 'player@three.com', password: 123456

seed_category_1 = Category.new title: "Fashion"
  sub_category_1 = SubCategory.new title: "Clothes"
  sub_category_1.category = seed_category_1
  sub_category_1.save
  business = Business.create(name: 'Humana')
  BusinessSubCategory.create(business: business, sub_category: sub_category_1)

    sub_category_2 = SubCategory.new title: "Sportswear"
    sub_category_2.category = seed_category_1
    sub_category_2.save
    BusinessSubCategory.create(business: business, sub_category: sub_category_2)
      sub_category_3 = SubCategory.new title: "Shoes"
      sub_category_3.category = seed_category_1
      sub_category_3.save
        sub_category_4 = SubCategory.new title: "Accessories"
        sub_category_4.category = seed_category_1
        sub_category_4.save
seed_category_1.save


seed_category_2 = Category.new title: "Finance"
seed_category_2.save

seed_category_3 = Category.new title: "Travel"
seed_category_3.save

seed_category_4 = Category.new title: "Energy"
seed_category_4.save

seed_category_5 = Category.new title: "Food"
seed_category_5.save

seed_category_6 = Category.new title: "Home"
seed_category_6.save


# 9.times do |x|
#   seed_category = Category.new title: "Category #{x}"
#   3.times do |y|
#     sub_category = SubCategory.new title: "SubCategory #{y}"
#     sub_category.category = seed_category
#     sub_category.save
#     # p "#{sub_category} created"
#   end
#   seed_category.save
#   Business.create!(name: "Business #{x}", category: seed_category)
#   # p "#{seed_category} created"
# end

