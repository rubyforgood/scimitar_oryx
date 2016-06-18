FactoryGirl.define do
  factory :picture do
    image File.new("#{Rails.root}/spec/photos/oryx.jpg")
  end
end
