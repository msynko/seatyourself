# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all

bobsburgers = Restaurant.create!(name: "Bob's Burgers", max_capacity: 50, opening_time: 8, closing_time: 22 , menu: "https://valeriebydesign.files.wordpress.com/2016/02/project5_williams.jpg", address: "60 Charles St E", price_range: "$$", phone_number: 6476729083)

sushiplace = Restaurant.create!(name: "Sushi Place", max_capacity: 20, opening_time: 11, closing_time: 23 , menu: "https://img.grouponcdn.com/deal/fmPws6o2uTweCftZu7yj/p4-2048x1229/v1/c700x420.jpg", address: "200 King St West", price_range: "$", phone_number: 6478757690)

phoplace = Restaurant.create!(name: "Pho", max_capacity: 10, opening_time: 9, closing_time: 23, menu: "https://thefoodieeats.com/wp-content/uploads/2018/03/pressure-cooker-pho-easy-pho-recipe-instant-pot-pho-01.jpg", address: "300 Spadina Ave.", price_range: "$", phone_number: 6474567890)
