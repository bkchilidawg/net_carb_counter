# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Create some users
@user1 = User.find_or_create_by(email: 'user1@example.com') do |user|
  user.password = 'password1'
  user.daily_net_carbs = 0
end

@user2 = User.find_or_create_by(email: 'user2@example.com') do |user|
  user.password = 'password2'
  user.daily_net_carbs = 0
end

# Create some foods
@apple = Food.find_or_create_by(name: 'Apple') do |food|
  food.carbs = 25
  food.fiber = 4
end

@banana = Food.find_or_create_by(name: 'Banana') do |food|
  food.carbs = 27
  food.fiber = 3
end

@broccoli = Food.find_or_create_by(name: 'Broccoli') do |food|
  food.carbs = 6
  food.fiber = 2
end

# Create some eaten foods
EatenFood.create(user: @user1, food: @apple)
EatenFood.create(user: @user1, food: @banana)
EatenFood.create(user: @user2, food: @broccoli)
# Add more eaten foods as needed