module Searchable
  extend ActiveSupport::Concern

  included do
    mattr_accessor :search_endpoint
    mattr_accessor :doc_endpoint

    after_save :add_to_index
  end

  class_methods do

    def search_client
      Aws::CloudSearchDomain::Client.new endpoint: search_endpoint
    end

    def doc_client
      Aws::CloudSearchDomain::Client.new endpoint: doc_endpoint
    end

    def search(terms)
      results = search_client.search({
        query_parser: 'simple',
        query: terms,
        query_options: {
          defaultOperator: 'or'
        }.to_json
      })
      hits = results.hits.hit.map &:id
      where(id: hits)
    end

  end

  private

  def add_to_index
    document = {
      type: 'add',
      id: id,
      fields: indexed_fields
    }

    Animal.doc_client.upload_documents({
      documents: [document].to_json,
      content_type: "application/json"
    })

  rescue => e
    logger.error e
  end

  def indexed_fields
    raise NotImplementedError
  end

end
