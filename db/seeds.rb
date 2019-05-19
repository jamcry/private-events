# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:"jamcry", email:"jamcry@hotmail.com",
             password:"foobar", password_confirmation:"foobar")
User.create!(name:"john", email:"john@doe.com",
             password:"foobar", password_confirmation:"foobar")
User.create!(name: "dirk", email:"gent@ly.com",
             password:"foobar", password_confirmation:"foobar")
User.create!(name: "arthur", email:"arthur@42.com",
             password:"foobar", password_confirmation:"foobar")

15.times do |n|
  User.create!(name: Faker::Name.unique.name,
               email: Faker::Internet.email,
               password: "foobar",
               password_confirmation: "foobar")
end

10.times do |n|
  e = Event.create!(title: Faker::Book.title,
                    creator: User.find(rand(1..15)),
                    location: Faker::University.name,
                    date: Faker::Time.between(10.days.ago, 10.days.from_now, :all))
  5.times {e.attendees << User.find(rand(1..15))}
end


