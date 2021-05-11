# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Playlist.destroy_all
User.destroy_all 
Song.destroy_all 


5.times do
    User.create(name: Faker::Games::ElderScrolls.name, 
    username: Faker::Games::ElderScrolls.first_name,
    hometown: Faker::Address.city, 
    password: "password")
end 

genre = ["Pop","R&B","EDM","Rap","Alternative"]

# 50.times do 
#     Song.create(title: Faker::Music::Prince.song , artist: Faker::Name.name, genre: genre.sample)
# end 

50.times do 
    Song.create(title: Faker::Music::Prince.song, artist: Faker::Name.name, genre: genre.sample)
end 

Playlist.create(name: "Blue", description: "For when you need a hug.", user: User.last, song: Song.first) 


puts "You got great taste! Keep it going!"
