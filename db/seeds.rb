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
  business = Business.create(name: 'Humana', description: 'From casual wear to highly elegant, from traditional costume to totally trendy!
  Whether you are looking for household goods or curtains for your living room - with us you will find maximum quality at a low price!
  Everything are individual pieces. Coincidence when you find two identical parts.', address: 'Friedrichstrasse 1, Berlin')
  BusinessSubCategory.create(business: business, sub_category: sub_category_1)

    sub_category_2 = SubCategory.new title: "Sportswear"
    sub_category_2.category = seed_category_1
    sub_category_2.save
    business2 = Business.create(name: 'Patagonia', description: 'Patagonia is a B Corp committed to the triple bottom line: profit, people, and planet. The brand\'s mission incorporates building the best products for those who love the great outdoors while also caring for the environment. Whether you\'re looking for yoga pants, outdoor jackets, running shorts, or activewear for little ones, this California-based brand has got you covered.', address: 'Chausseestrasse 25, Berlin')
    BusinessSubCategory.create(business: business2, sub_category: sub_category_2)

      sub_category_3 = SubCategory.new title: "Shoes"
      sub_category_3.category = seed_category_1
      sub_category_3.save
      business3 = Business.create(name: 'Allbirds', description: "Allbirds started with one simple mission: to make shoes in a better way, using natural materials. The brand's shoes are made from sustainable materials like FSC Certified Tencel Lyocell and ZQ Merino Wool, the latter of which ensures environmental and animal-friendly practices. With a simple pricing structure and comfortable, lightweight designs, these shoes will be your go-to for daily wear.", address: 'Chausseestrasse 25, Berlin')
      BusinessSubCategory.create(business: business3, sub_category: sub_category_3)

        sub_category_4 = SubCategory.new title: "Accessories"
        sub_category_4.category = seed_category_1
        sub_category_4.save
        business4 = Business.create(name: 'ACKERMANN', description: "Beate Sedlacek and Karl-Henning Hohmann design all kinds of high quality leather bags and accessories in their manufactory Ackermann Taschenmanufaktur in Lüneburg, Germany. Characterised by simple and timeless shapes and styles, their collections are not subject to any trend but emphasise your personality. Super soft and long-lasting, their good leather will develop patina which makes every piece gain in personal value over time. Since 1982 the experienced team ensures environmentally friendly production through world-leading environmental standards. The deerskin comes from Germany and Austria and is tanned “sämisch”, a centuries-old, natural tanning process, dyed by hand with natural colours. New: their olive leather, a cowhide tanned with a purely vegetable tanning agent derived from olive leaves.", address: 'hauptstrasse 1, Lüneburg, Germany')
        BusinessSubCategory.create(business: business4, sub_category: sub_category_4)

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

