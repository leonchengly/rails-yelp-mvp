# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

puts "Creating restaurants..."
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  restaurant.save
end

puts "Creating reviews..."
30.times do
  review = Review.new(
    restaurant_id: rand(40..50),
    rating: rand(1..5),
    content: Faker::Restaurant.review
  )
  review.save
end

puts "Finished!"
