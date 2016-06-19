require "rails_helper"

RSpec.describe AnimalMatchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/animal_matches").to route_to("animal_matches#index")
    end

    it "routes to #new" do
      expect(:get => "/animal_matches/new").to route_to("animal_matches#new")
    end

    it "routes to #show" do
      expect(:get => "/animal_matches/1").to route_to("animal_matches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/animal_matches/1/edit").to route_to("animal_matches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/animal_matches").to route_to("animal_matches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/animal_matches/1").to route_to("animal_matches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/animal_matches/1").to route_to("animal_matches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/animal_matches/1").to route_to("animal_matches#destroy", :id => "1")
    end

  end
end
