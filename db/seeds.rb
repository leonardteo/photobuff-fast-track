# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create( first_name: "Tony", last_name: "Stark", email: "test@example.com", password: "password", password_confirmation: "password")
puts "Created user #{user.first_name} #{user.last_name}"
