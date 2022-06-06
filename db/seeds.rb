# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Astronaut.destroy_all
SpaceStation.destroy_all

iss = SpaceStation.create!(name: 'International Space Station', habitable: true, max_occupants: 7)

ess = SpaceStation.create!(name: 'European Space Station', habitable: false, max_occupants: 7)

walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: iss.id)

oniell = Astronaut.create!(name: 'Jack Oniell', active: true, years_active: 10, space_station_id: ess.id)

kelly = Astronaut.create!(name: 'Buzz Lightyear', active: false, years_active: 27, space_station_id: iss.id)

armstrong = Astronaut.create!(name: 'Neil Armstrong', active: false, years_active: 10, space_station_id: ess.id)

lightyear = Astronaut.create!(name: 'Buzz Lightyear', active: true, years_active: 10, space_station_id: iss.id)
