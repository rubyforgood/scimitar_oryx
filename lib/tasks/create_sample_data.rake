namespace :create_sample_data do
   task :sample_animals,[:animalNum] => :environment do |t,args|
    args[:animalNum].to_i.times do
    	FactoryGirl.build(:sample_animal).save(validate: false)
	end
  end
  task :sample_facilities,[:facilityNum] => :environment do |t,args|
    args[:facilityNum].to_i.times do
    	FactoryGirl.build(:sample_facility).save(validate: false)
	end
  end

end


