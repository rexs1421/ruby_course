# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
(5..100).each do |id|
    Operation.create(
    amount: Faker::Number.number(digits: 2),
    odate:Faker::Date.between(from: '2023-05-01', to: '2023-06-18'),
    description: Faker::Tea.variety,
    category_id: number = Faker::Number.between(from: 6, to: 12)
    )
    
end