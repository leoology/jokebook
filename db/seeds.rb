require_relative '../app/models/api.rb'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples: 
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Api.new("https://v2.jokeapi.dev/joke/Any?blacklistFlags=sexist,explicit&amount=10").translate
