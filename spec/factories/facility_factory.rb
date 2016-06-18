FactoryGirl.define do
  factory :facility do
    name "Smithsonian-Mason School of Conservation"
    facility_type
    id 100
  end

  factory :sample_facility , class: Facility do
    name {Faker::Company.name}
    facility_type_id {Faker::Number.between(1,3)}
    spa {Faker::Boolean.boolean}
    acreage {Faker::Number.between(1,50000)}
    endangered_acreage {Faker::Number.between(1,50000)}
    temperture_controled {Faker::Boolean.boolean}
    water_features {Faker::Boolean.boolean}
    supplemental_feed {Faker::Boolean.boolean}
    facility_expertise_id {Faker::Number.between(1,5)}
    address {Faker::Address.street_address}
    longitude {Faker::Address.longitude}
    latitude {Faker::Address.latitude}
  end
end
