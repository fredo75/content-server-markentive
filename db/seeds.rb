require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  email: 'fred@gmail.com',
  password: 'azerty'
)
puts '____User created!____'

# puts 'Creating 10 leads...'
# 10.times do |i|
#   lead = Lead.create!(
#     firstname: Faker::FunnyName.name,
#     lastname: Faker::Name.name,
#     email: Faker::Internet.email,
#     company: Faker::Company.name
#   )
#   puts "#{i + 1}. #{lead.firstname}"
# end
puts '___Leads Done!!!____'


puts 'Creating 10 lead_by_form...'
10.times do |i|
  lead = Lead.create!(
    first_name: Faker::DragonBall.character,
    last_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    adress: Faker::Address.street_address,
    adress_2: Faker::Address.street_address,
    zip: Faker::Address.zip,
    city: Faker::Address.city,
    company: Faker::Company.name,
    user_id: 1
  )
  puts "#{i + 1}. #{lead.first_name}"
end
# puts 'Creating 10 Scrap_leads...'
# 10.times do |i|
#   buster = Lead_by_form.create!(
#     firstname: Faker::DragonBall.character
#   )
#   puts "#{i + 1}. #{buster.firstname}"
# end
puts 'Finished!'















# puts 'Cleaning database...'
# Restaurant.destroy_all

# puts 'Creating Fa...'
# restaurants_attributes = [
#   {
#     name:         'Dishoom',
#     address:      '7 Boundary St, London E2 7JE',
#     description:  'Buzzy destination for Indian street food in Bombay-style vintage decor.',
#     stars:        5
#   },
#   {
#     name:         'Pizza East',
#     address:      '56A Shoreditch High St, London E1 6PQ',
#     description:  'Pizzeria with industrial looks, serving rustic pizza and antipasti.',
#     stars:        4
#   }
# ]
# Restaurant.create!(restaurants_attributes)
# puts 'Finished!'
