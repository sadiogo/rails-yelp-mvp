# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  restaurant = Restaurant.new(
    {
      name: Faker::Restaurant.name,
      category: %w(chinese italian japanese french belgian).sample(1)[0],
      address: Faker::Address.street_address
    }
  )
  restaurant.save
  3.times do
    review = Review.new(
      {
        rating: (0..5).to_a.sample(1)[0],
        content:Faker::Restaurant.review
      }
    )
    review.restaurant = restaurant
    review.save
  end
end
