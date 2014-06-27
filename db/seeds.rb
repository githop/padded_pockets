# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: "Jack", email: "email@email.com", password: "password" )
poli = Politician.create(name: "Juniper Berry")
comment1 = Comment.create(content: "hey this here is comment number one")
comment2 = Comment.create(content: "first")
comment3 = Comment.create(content: "I was so close to eing first that time.") 

user2 = User.create(username: "githop", email:"jayson@hopping.com", password: "word")

user.comments << comment1
user2.comments << comment2
user2.comments << comment3

poli.comments << comment1
poli.comments << comment2
poli.comments << comment3

comment1.liked_by user
comment2.downvote_from user
comment2.liked_by user2