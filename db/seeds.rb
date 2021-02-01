require 'csv'
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
User.create! email: 'player@two.com', password: 123456, admin: true
User.create! email: 'player@three.com', password: 123456, admin: true
User.create! email: 'player@four.com', password: 123456, admin: true

seed_category_1 = Category.new title: "Fashion", description: "Explore the world of sustainable fashion and stay up-to-date with the latest sustainable fashion brands and retailers.", asset_path: "fashion.jpg"
  sub_category_1 = SubCategory.new title: "Clothes", asset_path: "fashion_clothes.jpg"
  sub_category_1.category = seed_category_1
  sub_category_1.save
    sub_category_2 = SubCategory.new title: "Sportswear", asset_path: "fashion_sportswear.jpg"
    sub_category_2.category = seed_category_1
    sub_category_2.save
      sub_category_3 = SubCategory.new title: "Shoes", asset_path: "fashion_shoes.jpg"
      sub_category_3.category = seed_category_1
      sub_category_3.save
      sub_category_4 = SubCategory.new title: "Accessories", asset_path: "fashion_accessories.jpg"
      sub_category_4.category = seed_category_1
      sub_category_4.save
seed_category_1.save

seed_category_2 = Category.new title: "Food", description: "Help your environment one bite at time. Here you will find all local and organis distributors. Battle climate change the delicious way!", asset_path: "food.jpg"
  sub_category_5 = SubCategory.new title: "Vegetarian", asset_path: "food_vegetarian.jpg"
  sub_category_5.category = seed_category_2
  sub_category_5.save
    sub_category_6 = SubCategory.new title: "Vegan", asset_path: "food_vegan.jpg"
    sub_category_6.category = seed_category_2
    sub_category_6.save
    sub_category_7 = SubCategory.new title: "Meat", asset_path: "food_meat.jpg"
    sub_category_7.category = seed_category_2
    sub_category_7.save
    seed_category_2.save
    
    seed_category_3 = Category.new title: "Home", description: "Find stylish and sustainable options to dress up your home. Sustainable furniture does not need to be made out of EUR-pallets.", asset_path: "home.jpg"
      sub_category_8 = SubCategory.new title: "Furniture", asset_path: "home_furniture.jpg"
      sub_category_8.category = seed_category_3
      sub_category_8.save
        sub_category_9 = SubCategory.new title: "Decor", asset_path: "home_decor.jpg"
        sub_category_9.category = seed_category_3
        sub_category_9.save
          sub_category_10 = SubCategory.new title: "Appliances", asset_path: "home_appliances.jpg"
          sub_category_10.category = seed_category_3
          sub_category_10.save
    seed_category_3.save
    
seed_category_4 = Category.new title: "Finance", description: "Use your budgets to help yourself and the environment. Increase your returns, not your carbon footprint.", asset_path: "finance.jpg"
  sub_category_11 = SubCategory.new title: "Banking", asset_path: "finance_banking.jpg"
  sub_category_11.category = seed_category_4
  sub_category_11.save
    sub_category_12 = SubCategory.new title: "Investment", asset_path: "finance_investment.jpg"
    sub_category_12.category = seed_category_4
    sub_category_12.save
seed_category_4.save

seed_category_5 = Category.new title: "Travel", description: "Explore and enjoy yourself in new places without breaking the bank or the ozone layer. Find the best eco-lodges and much more!", asset_path: "travel.jpg"
  sub_category_13 = SubCategory.new title: "Luggage", asset_path: "travel_luggage.jpg"
  sub_category_13.category = seed_category_5
  sub_category_13.save
    sub_category_14 = SubCategory.new title: "Accommodation", asset_path: "travel_accommodation.jpg"
    sub_category_14.category = seed_category_5
    sub_category_14.save
      sub_category_15 = SubCategory.new title: "Experiences", asset_path: "travel_experiences.jpg"
      sub_category_15.category = seed_category_5
      sub_category_15.save
        sub_category_16 = SubCategory.new title: "Mobility", asset_path: "travel_experiences.jpg"
        sub_category_16.category = seed_category_5
        sub_category_16.save
seed_category_5.save

seed_category_6 = Category.new title: "Energy", description: "Power your house and local providers. Find out which energy providers are the greenest in your area.", asset_path: "energy.jpg"
  sub_category_17 = SubCategory.new title: "Electricity", asset_path: "energy_electricity.jpg"
  sub_category_17.category = seed_category_6
  sub_category_17.save
    sub_category_18 = SubCategory.new title: "Gas", asset_path: "energy_gas.jpg"
    sub_category_18.category = seed_category_6
    sub_category_18.save
      sub_category_19 = SubCategory.new title: "Water", asset_path: "energy_water.jpg"
      sub_category_19.category = seed_category_6
      sub_category_19.save
seed_category_6.save

seed_category_7 = Category.new title: "Community Hub", description: "Connect with our community, see what's happening and get involved!", asset_path: "travel_experiences.jpg"
  sub_category_20 = SubCategory.new title: "Events", asset_path: "travel_experiences.jpg"
  sub_category_20.category = seed_category_7
  sub_category_20.save
    sub_category_21 = SubCategory.new title: "Workshops", asset_path: "travel_experiences.jpg"
    sub_category_21.category = seed_category_7
    sub_category_21.save
      sub_category_22 = SubCategory.new title: "Webinars", asset_path: "travel_experiences.jpg"
      sub_category_22.category = seed_category_7
      sub_category_22.save
        sub_category_23 = SubCategory.new title: "Marketplaces", asset_path: "travel_experiences.jpg"
        sub_category_23.category = seed_category_7
        sub_category_23.save
seed_category_7.save

csv_text = File.read('app/assets/csv/businesses_test.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Business.create!( :name => row[0],
                    :description => row[1],
                    :address => row[2],
                    :url =>row[3]
                  )
end

CSV.foreach('app/assets/csv/businesses_test.csv', headers: true) do |row|
  sub_category = SubCategory.find_by(title: row[4])
  p sub_category
  business = Business.find_by(name: row[0])
  p business
  BusinessSubCategory.create(business_id: business.id, sub_category_id: sub_category.id)
end

# csv_text = File.read('app/assets/csv/businesses_test.csv')
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   business = Business.new
#   business.name = row['name']
#   business.description = row['description']
#   business.address = row['address']
#   row[5..-1].each do |sub_category_id|
#     sub_category = BusinessSubCategory.find_or_create_by(sub_category_id)
#     business_sub_category.business << business_id if business_id
#   end
#   puts "#{business.name}, #{business.description} saved"
#   business.save
# end



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