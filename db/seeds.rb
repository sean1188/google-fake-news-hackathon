# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Checker.destroy_all
Checker.create(score: 1, fake_id: 1, name: 'CheckerNewsAsia', description: 'Resilient, strong, fact checker')
Checker.create(score: 1, fake_id: 2, name: 'CheckFact', description: 'Checker of only facts')
Checker.create(score: 1, fake_id: 3, name: 'NowFact', description: 'Realtime fact checking at your fingertips')
Checker.create(score: 1, fake_id: 4, name: 'fact.ly', description: 'A new way to fact check')
Checker.create(score: 1, fake_id: 5, name: 'Factr', description: 'Increase your fact checking tenfold')
Checker.all.each do |checker|
  puts checker.fake_id
end
