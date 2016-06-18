namespace :create_sample_data do
  task :sample_animals,[:animalNum] => :environment do |t,args|
    #require File.expand_path("spec/factories/animal_factory.rb")
    FactoryGirl.create_list( :sample_animal,args[:animalNum].to_i)
  end
  task :sample_facilities,[:facilityNum] => :environment do |t,args|
    #require File.expand_path("spec/factories/facility_factory.rb")
    FactoryGirl.create_list( :sample_facility,args[:facilityNum].to_i)
  end

end


