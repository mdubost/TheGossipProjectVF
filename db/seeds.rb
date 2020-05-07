City.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities')
User.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users') #commande pour reset l'id
Gossip.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('gossips') #commande pour reset l'id

10.times do
  c = City.create(name: Faker::Address.city)
end

10.times do
  u = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.characters(number: 10), age: Faker::Number.between(from: 18, to: 40), city_id: rand(1..10))
  u.email = u.first_name + '_' + u.last_name + '@mail.com'
  u.save
end

puts "User created"

20.times do
  g = Gossip.create(title: Faker::Lorem.characters(number:12), content: Faker::Quote.most_interesting_man_in_the_world, user_id: rand(1..10))
end

puts "Gossip created"