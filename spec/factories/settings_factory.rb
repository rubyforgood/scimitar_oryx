FactoryGirl.define do
  factory :user do
    email "user@site.com"
    password "password"
  end

  factory :species do
    name "Scimitar-horned Oryx"
    position 1
  end

  factory :sex do
    name "Female"
  end
end
