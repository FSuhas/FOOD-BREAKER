require 'open-uri'
require 'json'
require 'date'


puts "------------------------------"
puts "----------Start seed----------"
puts "------------------------------"
sleep(1)

puts "#destroy_all start ..."

NetworksUser.destroy_all

Network.destroy_all

Booking.destroy_all

Event.destroy_all

User.destroy_all

puts "#destroy_all finish !"

sleep(1)

puts "User seed start..."

pierre = User.new(email: 'pierre@gmail.com',
  password: '12345678',
  first_name: "pierre",
  last_name: "jean",
  avatar: '',
  address: "17 boulevard clemenceau 35000 Rennes",
  bio: "Take a gourmet break with a brunch of Brittany ! We can have a chat before over food as French cheese, French charcuterie, bread, pancakes and cider!! I will be delighted to welcome you in my restored farmhouse from the 18th century with an old bread oven and a lovely garden.")

pierre.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "pierre.png", content_type: "image/png")
pierre.save!

sarah = User.new(email: 'sarah@gmail.com',
  password: '12345678',
  first_name: "sarah",
  last_name: "du desert",
  avatar: '',
  address: "35 rue kleber 33200 Bordeaux",
  bio: "Being Portuguesee and located in Bordeaux for more than 10 years, I want to share the very best of Portugal, the Portuguese and Portuguese traditional gastronomy and our own special sweets. During dinners or classes we chat about food, tips of my city in a cozy and relaxed environment.")

sarah.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?woman"), filename: "sarahh.png", content_type: "image/png")
sarah.save!

nicolas = User.new(email: 'nicolas@gmail.com',
  password: '12345678',
  first_name: "nicolas",
  last_name: "petit",
  avatar: '',
  address: "4 rue des basques 64200 Bayonne",
  bio: "Hi ! I'm Nicolas. I love traveling, design, nature, photos, art and cooking of course. I would like to welcome you in my house in the South of France not far from Biarritz. My daughters, my wife and my cats would be happy to welcome you!")

nicolas.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "nicolas.png", content_type: "image/png")
nicolas.save!

louis = User.new(email: 'louis@gmail.com',
  password: '12345678',
  first_name: "louis",
  last_name: "lafonte",
  avatar: '',
  address: "60 rue de paradis 75010 Paris",
  bio: "Parisian journalist and producer, I've been travelling around the World since 1996 and living in France's capital since 2000. I enjoy sharing travel experiences, Paris tips (and food !) with travellers and locals. Let's do it around my table!")

louis.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "louis.png", content_type: "image/png")
louis.save!

juliette = User.new(email: 'juliette@gmail.com',
  password: '12345678',
  first_name: "juliette",
  last_name: "Jetaime",
  avatar: '',
  address: "6 rue de la jussienne 75002 Paris",
  bio: "I'm a Parisian born and raised. I'm a food and history lover. I'm a glutton for cheese, buttery saucy meals, sugary treats and chocolate (but always good quality)! Let's share my passions together!")

juliette.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?woman"), filename: "juliette.png", content_type: "image/png")
juliette.save!

puts "user seed finish !"

sleep(1)

puts "Event seed start..."

pierre_event = Event.new(title: "frendly Parisian Dinner",
  experience: "Dinner",
  address: "17 boulevard clemenceau 35000 Rennes",
  description: "Dinner with friends around French cheeses and wines",
  date: Date.new(2022,6,20),
  language: "French",
  capacity: 10, user: pierre)

pierre_event.photos.attach(io: URI.open("https://source.unsplash.com/random"), filename: "pierreEvent.png", content_type: "image/png")
pierre_event.save!

pierre_event_two = Event.new(title: "Brunch on the beach",
  experience: "Brunch",
  address: "plage du solidor 35400 Saint-Malo",
  description: "Brunch with a view on the beach",
  date: Date.new(2022,6,14),
  language: "English",
  capacity: 8,
  user: pierre)

pierre_event_two.photos.attach(io: URI.open("https://source.unsplash.com/random"), filename: "pierreEvent2.png", content_type: "image/png")
pierre_event_two.save!

sarah_event = Event.new(title: "Learn Portuguese Food",
  experience: "Cooking Class",
  address: "17 boulevard clemenceau 35000 Rennes",
  description: "Portuguese food, songs and fun!",
  date: Date.new(2022,6,12),
  language: "French",
  capacity: 5,
  user: sarah)

sarah_event.photos.attach(io: URI.open("https://source.unsplash.com/random"),
filename: "sarahEvent.png",
content_type: "image/png")

sarah_event.save!

nicolas_event = Event.new(title: "Traditional Dim Sum Cooking Class",
  experience: "Cooking Class",
  address: "Tour eiffel",
  description: "Learn how to make Dim with friends",
  date: Date.new(2022,6,24),
  language: "French",
  capacity: 6,
  user: nicolas)

nicolas_event.photos.attach(io: URI.open("https://source.unsplash.com/random"), filename: "nicolas_event.png", content_type: "image/png")
nicolas_event.save!

puts "Event seed finish !"

sleep(1)

puts "Booking seed start..."

Booking.create(nb_guest: "4", confirmation: false, user_id: juliette.id, event_id: pierre_event.id )
Booking.create(nb_guest: "1", confirmation: true, user_id: nicolas.id, event_id: pierre_event_two.id )
Booking.create(nb_guest: "2", confirmation: true, user_id: sarah.id, event_id: sarah_event.id )
Booking.create(nb_guest: "6", confirmation: false, user_id: sarah.id, event_id: sarah_event.id )
Booking.create(nb_guest: "3", confirmation: false, user_id: nicolas.id, event_id: nicolas_event.id )

puts "Booking seed finish..."

sleep(1)

puts "Network seed start..."

company = Network.create(name: "My company", user_id: juliette.id)
good_food = Network.create(name: "Good Food", user_id: pierre.id)
Network.create(name: "Wine Lovers", user_id: nicolas.id)
pizza = Network.create(name: "Pizzzzzaaaaa !!!!!!", user_id: nicolas.id)

puts "Network seed finish..."

sleep(1)

puts "Networks User seed start..."

NetworksUser.create(user_id: juliette.id, network_id: good_food.id)
NetworksUser.create(user_id: nicolas.id, network_id: good_food.id)
NetworksUser.create(user_id: louis.id, network_id: good_food.id)
NetworksUser.create(user_id: juliette.id, network_id: pizza.id)
NetworksUser.create(user_id: pierre.id, network_id: pizza.id)
NetworksUser.create(user_id: nicolas.id, network_id: company.id)
NetworksUser.create(user_id: louis.id, network_id: company.id)

puts "Networks User seed finish..."

sleep(1)

puts "------------------------------"
puts "----------All Good !----------"
puts "------------------------------"

sleep(1)
