# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
 movies = [
   { name: "The Shawshank Redemption", release_date: Date.new(1994, 9, 22) },
   { name: "The Godfather", release_date: Date.new(1972, 3, 14) },
   { name: "The Godfather: Part II", release_date: Date.new(1974, 12, 20) },
   { name: "The Dark Knight", release_date: Date.new(2008, 7, 14) },
   { name: "12 Angry Men", release_date: Date.new(1957, 4, 10) },
   { name: "Schindler's List", release_date: Date.new(1993, 11, 30) }
 ]

 movies.each do |movie|
   Movie.create(movie)
 end
