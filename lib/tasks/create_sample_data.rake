namespace :create_sample_data do
  task :sample_animals => :environment do
    #require File.expand_path("spec/factories/animal_factory.rb")
	FactoryGirl.create_list( :sample_animal,10)
  end 

end


