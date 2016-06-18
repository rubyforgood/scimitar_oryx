ENV["AWS_ACCESS_KEY_ID"]="AKIAJOEA2PMQHX7PKSQA"
ENV["AWS_SECRET_ACCESS_KEY"]="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"

require 'aws-sdk'
require 'pry'
require 'json'


client = Aws::CloudSearch::Client.new(region: "us-west-2")

p client.list_domain_names

endpoint = "https://doc-animals-01-227on7d7ofixy7zudi76owupcy.us-west-2.cloudsearch.amazonaws.com"
client = Aws::CloudSearchDomain::Client.new endpoint: endpoint


resp = client.upload_documents({
  documents: [{ type: 'add', id: 3, version: 2, fields: {date_of_birth: '2015-12-25T00:00:00Z', species: 'zzz', facility: 'fossil'}}].to_json,
  content_type: "application/json", # required, accepts application/json, application/xml
})

resp = client.upload_documents({
  documents: [{ type: 'add', id: 4, version: 2, fields: {date_of_birth: '2013-12-25T00:00:00Z', species: 'zzz', facility: 'mason'}}].to_json,
  content_type: "application/json", # required, accepts application/json, application/xml
})


search_endpoint = "https://search-animals-01-227on7d7ofixy7zudi76owupcy.us-west-2.cloudsearch.amazonaws.com"

search_client = Aws::CloudSearchDomain::Client.new endpoint: search_endpoint

p search_client.search({query_parser: 'simple', query: 'xxx'})

p search_client.search({query_parser: 'simple', query: 'yyy'})

binding.pry

#h = {:type=>"add", :id=>"1", :version=>"1", :lang=>"en", :fields=>{:species=>"xxx"}}

#Aws::CloudSearch.client post_sdf endpoint, h

#client.describe_domains(domain_names: ["animals-01"])[:domain_status_list].first[:doc_service][:endpoint]
