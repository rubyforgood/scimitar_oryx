namespace :searchable do
  desc 'reindex all animals'
  task index_all_animals: :environment do
    Animal.searchable.each do |animal|
      p "indexing #{animal.id} #{animal.name}"
      animal.send :add_to_index
    end
  end

  def batch_fetch_documents(size=1000)
    Animal.search_client.search(
        query_parser: 'lucene',
        query: "*:*",
        size: 1000
    )
  end

  desc "remove all animal documents from index"
  task remove_all_animals: :environment do
    while
      results = batch_fetch_documents
      found = results.hits.found
      break unless found > 0

      ids = results.hits.hit.map(&:id)
      documents = ids.map { |id| { type:'delete', 'id': id } }

      Animal.doc_client.upload_documents({
        documents: documents.to_json,
        content_type: "application/json"
      })
      sleep 1 # allow index to catch up
    end
  end
end

