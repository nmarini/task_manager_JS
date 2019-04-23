# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!({name: 'Bob', email: 'bobmail.com', password: 'password'})
user2 = User.create!({name: 'Sam', email: 'sammail.com', password: 'password'})
user3 = User.create!({name: 'Jim', email: 'jimmail.com', password: 'password'})
user4 = User.create!({name: 'Ryan', email: 'ryanmail.com', password: 'password'})

list1 = List.create!({title: 'A List', user_id: user1.id})
list2 = List.create!({title: 'List', user_id: user2.id})
list3 = List.create!({title: 'My List', user_id: user3.id})
list4 = List.create!({title: 'Work List', user_id: user4.id})

task1 = Task.create!({title: 'A Task', note: 'a note', list_id: list1.id})
task2 = Task.create!({title: 'Task #1', note: 'a note', list_id: list2.id})
task3 = Task.create!({title: 'Do This', note: 'Do this first', list_id: list3.id})
task4 = Task.create!({title: 'Hard', note: 'take your time', list_id: list4.id})
task5 = Task.create!({title: 'B Task', note: 'B note', list_id: list1.id})
task6 = Task.create!({title: '1 Task', note: '1 note', list_id: list2.id})
task7 = Task.create!({title: 'Task Two', note: 'two note', list_id: list3.id})

