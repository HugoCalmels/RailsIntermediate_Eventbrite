# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do 
  u = User.new(
    first_name: "toto",
    last_name: "toto",
    description: "toto",
    email: "toto@example.com",
    password: "tototo",
  )
  u.skip_confirmation!
  u.save
  u.errors.messages
end

10.times do 
  e = Event.new(
    start_date: "11-11-2001",
    start_hour: "09:30",
    duration: rand(1..6),
    title: "azdazd",
    description: "afeaef",
    price: rand(1..6),
    location: "toulouse",
    organizer: User.all.sample
  )
  e.save 
  e.errors.messages
end

10.times do 
  a = Attendance.new(
    stripe_customer_id: rand(1..6),
    user: User.all.sample,
    event: Event.all.sample
  )
  a.save 
  a.errors.messages
end


puts "Database filled !"