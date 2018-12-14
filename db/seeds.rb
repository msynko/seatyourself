# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bobsburgers = Restaurant.create!(name: "Bob's Burgers", max_capacity: 50, opening_time: DateTime.new(2018, 12, 14, 9), closing_time: DateTime.new(2018, 12, 14, 23), menu: "https://www.bobsburgersandbrew.com/content/Fall_Winter_Menu/fall_winter_menu", address: "60 Charles St E", price_range: "$$", phone_number: 6476729083)
