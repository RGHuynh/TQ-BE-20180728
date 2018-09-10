# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_params = [
  {
    name: 'Bob',
    email: "t@gmail.com",
    password: '123'
  },
  {
    name: 'Bob',
    email: "w@gmail.com",
    password: '123'
  },
  {
    name: 'Bob',
    email: "r@gmail.com",
    password: '123'
  },
  {
    name: 'Bob',
    email: "q@gmail.com",
    password: '123'
  },
  {
    name: 'Bob',
    email: "p@gmail.com",
    password: '123'
  },
  {
    name: 'Bob',
    email: "y@gmail.com",
    password: '123'
  }
]

checkin_params = [
  {
    name: "Trinkets And Treasures",
    longitude: -119.41792951887157,
    latitude: 36.77825936091546,
    checkin: true,
    user_id: User.find_by(email: "t@gmail.com")[:id]
  },
  {
    name: "Trinkets And Treasures",
    longitude: -119.41792951887157,
    latitude: 36.77825936091546,
    checkin: true,
    user_id: User.find_by(email: "w@gmail.com")[:id]
  },
  {
    name: "Trinkets And Treasures",
    longitude: -119.41792951887157,
    latitude: 36.77825936091546,
    checkin: true,
    user_id: User.find_by(email: "r@gmail.com")[:id]
  },
  {
    name: "Trinkets And Treasures",
    longitude: -119.41792951887157,
    latitude: 36.77825936091546,
    checkin: true,
    user_id: User.find_by(email: "q@gmail.com")[:id]
  },
  {
    name: "Trinkets And Treasures",
    longitude: -119.41792951887157,
    latitude: 36.77825936091546,
    checkin: true,
    user_id: User.find_by(email: "p@gmail.com")[:id]
  },
  {
    name: "New area",
    longitude: -119.41792951887157,
    latitude: 36.77825936091546,
    checkin: true,
    user_id: User.find_by(email: "y@gmail.com")[:id]
  }
]

users_params.each do |user|
  User.create(user)
end

checkin_params.each do |checkin|
  Checkin.create(checkin)
end