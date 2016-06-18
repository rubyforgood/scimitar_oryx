require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do

  let(:valid_animal) { build :sample_animal }
  let(:invalid_animal) { build :sample_animal, name: nil }
  let(:valid_session) {{}}

  describe "GET #index" do
    before do
      sign_in
    end
    it "assigns all animals as @animals" do
      animal = Animal.create! valid_animal.attributes
      get :index, {}, valid_session
      expect(assigns(:animals)).to eq([animal])
    end
    it "renders the index template" do
      animal = Animal.create! valid_animal.attributes
      get :index, {}, valid_session
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    before do
      sign_in
    end
    it "assigns the requested animal as @animal" do
      animal = Animal.create! valid_animal.attributes
      get :show, {:id => animal.to_param}, valid_session
      expect(assigns(:animal)).to eq(animal)
    end
    it "renders the show template" do
      animal = Animal.create! valid_animal.attributes
      get :show, {:id => animal.to_param}, valid_session
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before do
      sign_in
    end
    it "assigns a new animal as @animal" do
      get :new, {}, valid_session
      expect(assigns(:animal)).to be_a_new(Animal)
    end
    it "renders the new template" do
      get :new, {}, valid_session
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before do
      sign_in
    end
    it "assigns the requested animal as @animal" do
      animal = Animal.create! valid_animal.attributes
      get :edit, {:id => animal.to_param}, valid_session
      expect(assigns(:animal)).to eq(animal)
    end
    it "renders the edit template" do
      animal = Animal.create! valid_animal.attributes
      get :edit, {:id => animal.to_param}, valid_session
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before do
      sign_in
    end
    context "with valid params" do
      it "creates a new Animal" do
        expect {
          post :create, {:animal => valid_animal.attributes}, valid_session
        }.to change(Animal, :count).by(1)
      end

      it "assigns a newly created animal as @animal" do
        post :create, {:animal => valid_animal.attributes}, valid_session
        expect(assigns(:animal)).to be_a(Animal)
        expect(assigns(:animal)).to be_persisted
      end

      it "redirects to the created animal" do
        post :create, {:animal => valid_animal.attributes}, valid_session
        expect(response).to redirect_to(Animal.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved animal as @animal" do
        post :create, {:animal => invalid_animal.attributes}, valid_session
        expect(assigns(:animal)).to be_a_new(Animal)
      end

      it "re-renders the 'new' template" do
        post :create, {:animal => invalid_animal.attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before do
      sign_in
    end
    context "with valid params" do
      new_attributes = { comments: "This animal likes quiet spaces" }

      it "updates the requested animal" do
        animal = Animal.create! valid_animal.attributes
        put :update, {:id => animal.to_param, :animal => new_attributes}, valid_session
        animal.reload
        expect(response).to redirect_to(animal)
      end

      it "assigns the requested animal as @animal" do
        animal = Animal.create! valid_animal.attributes
        put :update, {:id => animal.to_param, :animal => valid_animal.attributes}, valid_session
        expect(assigns(:animal)).to eq(animal)
      end

      it "redirects to the animal" do
        animal = Animal.create! valid_animal.attributes
        put :update, {:id => animal.to_param, :animal => valid_animal.attributes}, valid_session
        expect(response).to redirect_to(animal)
      end
    end

    context "with invalid params" do
      it "assigns the animal as @animal" do
        animal = Animal.create! valid_animal.attributes
        put :update, {:id => animal.to_param, :animal => invalid_animal.attributes}, valid_session
        expect(assigns(:animal)).to eq(animal)
      end

      it "re-renders the 'edit' template" do
        animal = Animal.create! valid_animal.attributes
        put :update, {:id => animal.to_param, :animal => invalid_animal.attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in
    end
    it "destroys the requested animal" do
      animal = Animal.create! valid_animal.attributes
      expect {
        delete :destroy, {:id => animal.to_param}, valid_session
      }.to change(Animal, :count).by(-1)
    end

    it "redirects to the animals list" do
      animal = Animal.create! valid_animal.attributes
      delete :destroy, {:id => animal.to_param}, valid_session
      expect(response).to redirect_to(animals_url)
    end
  end
end
