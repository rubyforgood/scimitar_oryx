require 'rails_helper'

RSpec.describe "AnimalMatches", type: :request do
  describe "GET /animal_matches" do
    it "works! (now write some real specs)" do
      get animal_matches_path
      expect(response).to have_http_status(200)
    end
  end
end
