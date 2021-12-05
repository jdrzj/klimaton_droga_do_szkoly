# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = "test12"
city = City.new(name: "Wrocław").save
school = School.new(name: "Szkoła 1", city_id: city.id).save
parent = User.new(email: "michal@eco.test", role: "parent", firstname: "Michal", lastname: "Nowak", school_id: school.id, password: password).save
kid1 = User.new(email: "julka@eco.test", role: "student", firstname: "Julia", lastname: "Nowak", school_id: school.id, parent_id: parent.id, password: password).save
kid2 = User.new(email: "bartek@eco.test", role: "student", firstname: "Bartek", lastname: "Nowak", school_id: school.id, parent_id: parent.id, password: password).save
