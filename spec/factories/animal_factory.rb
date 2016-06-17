FactoryGirl.define do
  factory :animal do
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
    # sex
    # rearing
    # reproductive_status
  end
end
