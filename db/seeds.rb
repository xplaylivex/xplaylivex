# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Image.create([
  { filename: 're6.png', hash_id: 'azerty', extension: 'png' }
])

Game.create([
  { name: 'Resident Evil 6', comment: 'Lul c nul', state: Game::CURRENT, image_id: Image.first.id }
])
