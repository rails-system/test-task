# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..4).each do |i|
  t = Team.find_or_create_by(name: "Team #{i}")
  (1..4).each do |j|
    k = "#{i}#{j}"
    t.users.create(email: "test#{k}@mailinator.com", first_name: "Test", last_name: "User #{k}", dob: "25/12/1993", mobile_number: "9876543210", password: "password", password_confirmation: "password") rescue nil
  end
end