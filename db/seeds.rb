# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create("email" => "test@gmail.com", "password" => "123", "password_confirmation" => "123")

Meal.create("title" => "Lunch", "food_name" => ["Apple, Banana"], "sick" => "false", "comments" => "ate lots of stuff today", "user_id" => 1)

Meal.create("title" => "Dinner", "food_name" => ["Chicken, Rice", "peppers"], "sick" => "true", "sick_type"=> "stomach, ""comments" => "Ugh!", "user_id" => 1)

Meal.create("title" => "Breakfast", "food_name" => ["Apple, Banana"], "sick" => "false", "comments" => "MMMM Breakfast", "user_id" => 1)

