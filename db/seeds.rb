# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Business.destroy_all
Category.destroy_all
SubCategory.destroy_all
User.destroy_all

User.create! email: 'player@one.com', password: 123456
User.create! email: 'player@two.com', password: 123456
User.create! email: 'player@three.com', password: 123456

9.times do |x|
  seed_category = Category.new title: "Category #{x}"
  3.times do |y|
    sub_category = SubCategory.new title: "SubCategory #{y}"
    sub_category.category = seed_category
    sub_category.save
    # p "#{sub_category} created"
  end
  seed_category.save
  # p "#{seed_category} created"
end

Business.create!(name: "Business 1", category_id: 1)
Business.create!(name: "Business 2", category_id: 2)
Business.create!(name: "Business 3", category_id: 3)
