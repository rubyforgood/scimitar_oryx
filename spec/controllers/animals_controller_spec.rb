require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do

  let(:valid_animal) { build :sample_animal }
  let(:invalid_animal) { build :sample_animal, date_of_birth: '' }
  let(:valid_session) {{}}

  describe "GET #index" do
    before do
      sign_in
    end
    it "assigns all animals as @animals" do
      animal = create(:animal)
      get :index, params: { facility_id: animal.facility_id }, session: valid_session
      expect(assigns(:animals)).to eq([animal])
    end
    it "renders the index template" do
      animal = create(:animal)
      get :index, params: { facility_id: animal.facility_id }, session: valid_session
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    before do
      sign_in
    end
    it "assigns the requested animal as @animal" do
      animal = create(:animal)
      get :show, params: {id: animal.id, facility_id: animal.facility_id}, session: valid_session
      expect(assigns(:animal)).to eq(animal)
    end
    it "renders the show template" do
      animal = create(:animal)
      get :show, params: {id: animal.id, facility_id: animal.facility_id}, session: valid_session
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before do
      sign_in
    end
    it "assigns a new animal as @animal" do
      facility = create(:facility)
      get :new, params: {facility_id: facility.id}, session: valid_session
      expect(assigns(:animal)).to be_a_new(Animal)
    end
    it "renders the new template" do
      facility = create(:facility)
      get :new, params: {facility_id: facility.id}, session: valid_session
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before do
      sign_in
    end
    it "assigns the requested animal as @animal" do
      animal = create(:animal)
      get :edit, params: {id: animal.id, facility_id: animal.facility_id}, session: valid_session
      expect(assigns(:animal)).to eq(animal)
    end
    it "renders the edit template" do
      animal = create(:animal)
      get :edit, params: {id: animal.id, facility_id: animal.facility_id}, session: valid_session
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before do
      sign_in
    end
    context "with valid params" do
      it "creates a new Animal" do
        facility = create(:facility)
        expect {
          post :create, params: {facility_id: facility.id, :animal => valid_animal.attributes}, session: valid_session
        }.to change(Animal, :count).by(1)
      end

      it "assigns a newly created animal as @animal" do
        facility = create(:facility)
        post :create, params: {facility_id: facility.id, :animal => valid_animal.attributes}, session: valid_session
        expect(assigns(:animal)).to be_a(Animal)
        expect(assigns(:animal)).to be_persisted
      end

      it "redirects to the created animal" do
        facility = create(:facility)
        post :create, params: {facility_id: facility.id, :animal => valid_animal.attributes}, session: valid_session
        expect(response).to redirect_to(facility_animal_path(facility, Animal.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved animal as @animal" do
        facility = create(:facility)
        post :create, params: {facility_id: facility.id, :animal => invalid_animal.attributes}, session: valid_session
        expect(assigns(:animal)).to be_a_new(Animal)
      end

      it "re-renders the 'new' template" do
        facility = create(:facility)
        post :create, params: {facility_id: facility.id, :animal => invalid_animal.attributes}, session: valid_session
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
        animal = create(:animal)
        put :update, params: {facility_id: animal.facility.id, :id => animal.id, :animal => new_attributes}, session: valid_session
        animal.reload
        expect(response).to redirect_to(facility_animal_path(animal.facility, animal))
      end

      it "assigns the requested animal as @animal" do
        animal = create(:animal)
        put :update, params: {facility_id: animal.facility.id, :id => animal.id, :animal => new_attributes}, session: valid_session
        expect(assigns(:animal)).to eq(animal)
      end

      it "redirects to the animal" do
        animal = create(:animal)
        put :update, params: {facility_id: animal.facility.id, :id => animal.id, :animal => new_attributes}, session: valid_session
        expect(response).to redirect_to(facility_animal_path(animal.facility, animal))
      end
    end

    context "with invalid params" do
      bad_attributes = { name: nil }
      it "assigns the animal as @animal" do
        animal = create(:animal)
        put :update, params: {facility_id: animal.facility.id, :id => animal.id, :animal => bad_attributes}, session: valid_session
        expect(assigns(:animal)).to eq(animal)
      end

      it "re-renders the 'edit' template" do
        animal = create(:animal)
        put :update, params: {facility_id: animal.facility.id, :id => animal.id, :animal => bad_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in
    end
    it "destroys the requested animal" do
      animal = create(:animal)
      expect {
        delete :destroy, params: {facility_id: animal.facility_id, :id => animal.to_param}, session: valid_session
      }.to change(Animal, :count).by(-1)
    end

    it "redirects to the animals list" do
      animal = create(:animal)
      delete :destroy, params: {facility_id: animal.facility_id, :id => animal.to_param}, session: valid_session
      expect(response).to redirect_to(facility_animals_path(animal.facility, notice: "Animal was successfully destroyed."))
    end
  end
end
