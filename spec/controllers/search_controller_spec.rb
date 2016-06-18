require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #animals" do
    it "returns http success" do
      get :animals
      expect(response).to have_http_status(:success)
    end
  end

end
