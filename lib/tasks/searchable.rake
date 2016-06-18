namespace :searchable do
  desc 'reindex all animals'
  task reindex_animals: :environment do
    Animal.searchable.each do |animal|
      p "indexing #{animal.id} #{animal.name}"
      animal.send :add_to_index
    end
  end
end

