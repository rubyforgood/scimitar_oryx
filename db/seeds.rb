# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Species.where(name: 'Addax').first_or_create
Species.where(name: 'Addra (dama) Gazelle').first_or_create
Species.where(name: 'Nubian ibex').first_or_create
Species.where(name: 'Scimitar-horned Oryx').first_or_create
Species.where(name: 'Sable Antelope').first_or_create
Species.where(name: 'Tajik Markhor').first_or_create
Species.where(name: 'Transcaspian Urial').first_or_create

Sex.where(name: 'Male').first_or_create
Sex.where(name: 'Female').first_or_create
Sex.where(name: 'Unknown').first_or_create

Rearing.where(name: 'Parent reared').first_or_create
Rearing.where(name: 'Hand reared').first_or_create

ReproductiveStatus.where(name: 'Unproven').first_or_create
ReproductiveStatus.where(name: 'Proven').first_or_create
ReproductiveStatus.where(name: 'Post-reproductive').first_or_create

FacilityType.where(name: 'Institution').first_or_create
FacilityType.where(name: 'Ranch').first_or_create
FacilityType.where(name: 'Individual').first_or_create

FacilityExpertise.where(name: 'Conservation breeding').first_or_create
FacilityExpertise.where(name: 'Reproductive Science').first_or_create
FacilityExpertise.where(name: 'Biobanking').first_or_create
FacilityExpertise.where(name: 'Natural Resource Management').first_or_create

Facility.where(name: 'Example Ranch', facility_type_id: 2).first_or_create
