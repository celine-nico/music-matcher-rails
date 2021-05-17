# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Match.destroy_all
User.destroy_all 
Kpopgroup.destroy_all 


5.times do
    User.create(name: Faker::Name.name, 
    username: Faker::Games::Pokemon.name,
    hometown: Faker::Address.city, 
    password: "password")
end 

label = ["SM Entertainment", "YG Entertainment", "JYPE", "BigHit", "Pledis Entertainment", "KQ Entertainment"]

type = ["boy group", "girl group"]

concept = ["cute", "crush", "fantasy", "horror", "rock", "nostalgia"]

genre = ["EDM", "Pop", "R&B", "Trap", "Rock"]

15.times do 
    Kpopgroup.create(name: Faker::Kpop.iii_groups, members: rand(15), label: label.sample, genre: genre.sample, group_type: type.sample)
end 


10.times do 
    Match.create(user: User.all.sample, kpopgroup: Kpopgroup.all.sample, concept: concept.sample)
end  


puts "Who wins the dongsaeng this year? hmmm..."
