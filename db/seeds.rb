# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.development?
  puts "[ db/seed.rb ] Seed data is for development only, not #{Rails.env}"
  exit 0
end

require 'factory_bot'

Widget.destroy_all
Manufacturer.destroy_all
Address.destroy_all
WidgetStatus.destroy_all

puts '[ db/seed.rb ] Creating development data...'

FactoryBot.create(:widget_status, name: 'Fresh')
10.times do
  FactoryBot.create(:manufacturer)
end
cyberdyne = FactoryBot.create(:manufacturer, name: 'Cyberdyne Systems')
FactoryBot.create(:widget, name: 'Stembolt', manufacturer: cyberdyne)

puts '[ db/seed.rb ] Done'
