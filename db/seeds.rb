# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Create Users ..."

user1 = User.create(:name => "John Smith", :email => "john@inotechne.com", :password => "johntest", :password_confirmation => "johntest")

user2 = User.create(:name => "Anny Smith", :email => "anny@inotechne.com", :password => "annytest", :password_confirmation => "annytest")

Relationship.create(:follower => user2, :following => user1)
