FactoryGirl.define do
  factory :animal do
    id 100
    name "JC"
    date_of_birth Date.parse("2016-06-16")
    studbook "123"
    sire "Dad"
    dam "Mom"
    tag "ABC"
    comments "the most beautiful oryx ever"
    searchable true
    facility
    species
    sex
    pictures { [ create(:picture) ] }

    # sex_id
    # rearing
    # reproductive_status
  end

  factory :sample_animal , class: Animal do
    id {Faker::Number.between(41,999999999)}
    name {Faker::Name.first_name}
    date_of_birth {Faker::Date.between(25.years.ago,Date.today)}
    studbook {Faker::Number.number(10)}
    sire {Faker::Number.between(1,20)}
    dam  {Faker::Number.between(21,40)}
    tag {Faker::Number.between(41,999999999)}
    comments {Faker::StarWars.quote}
    searchable true
    facility_id {Faker::Number.between(1,10)}
    pictures { [ create(:picture) ] }
    species_id {[1,2,3,4,5,6,7].sample}
    species
    sex_id {[1,2].sample}
    sex
    # rearing
    reproductive_status_id {[1, 2, 3].sample}
  end
end
