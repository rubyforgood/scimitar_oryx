# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Species.create(name: 'Addax')
Species.create(name: 'Addra (dama) Gazelle')
Species.create(name: 'Nubian ibex')
Species.create(name: 'Scimitar-horned Oryx')
Species.create(name: 'Sable Antelope')
Species.create(name: 'Tajik Markhor')
Species.create(name: 'Transcaspian Urial')

FacilityType.create(name: 'Institution')
FacilityType.create(name: 'Ranch')
FacilityType.create(name: 'Individual')
