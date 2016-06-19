json.array!(@animal_matches) do |animal_match|
  json.extract! animal_match, :id, :animal_id, :potential_mate_id
  json.url animal_match_url(animal_match, format: :json)
end
