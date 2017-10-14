# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Checker.destroy_all
Checker.create(score: 1, fake_id: 1)
Checker.create(score: 1, fake_id: 2)
Checker.create(score: 1, fake_id: 3)
Checker.create(score: 1, fake_id: 4)
Checker.create(score: 1, fake_id: 5)
Checker.all.each do |checker|
  puts checker.fake_id
end
