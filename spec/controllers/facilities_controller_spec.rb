require 'rails_helper'

RSpec.describe FacilitiesController, type: :controller do

  let(:valid_facility) { build :facility}
  let(:invalid_facility) { build :facility, facility_type_id: ''}
  let(:valid_session) { {} }

  describe "GET #index" do
    before do
      sign_in(create(:user))
    end
    it "assigns all facilities as @facilities" do
      facility = Facility.create! valid_facility.attributes
      get :index, {}, valid_session
      expect(assigns(:facilities)).to eq([facility])
    end
    it "renders the index template" do
      facility = Facility.create! valid_facility.attributes
      get :index, {}, valid_session
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    before do
      sign_in(create(:user))
    end
    it "assigns the requested facility as @facility" do
      facility = Facility.create! valid_facility.attributes
      get :show, {:id => facility.to_param}, valid_session
      expect(assigns(:facility)).to eq(facility)
    end

    it "renders the show template" do
      facility = Facility.create! valid_facility.attributes
      get :show, {:id => facility.to_param}, valid_session
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before do
      sign_in(create(:user))
    end
    it "assigns a new facility as @facility" do
      get :new, {}, valid_session
      expect(assigns(:facility)).to be_a_new(Facility)
    end
    it "renders the new template" do
      get :new, {}, valid_session
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before do
      sign_in(create(:user))
    end
    it "assigns the requested facility as @facility" do
      facility = Facility.create! valid_facility.attributes
      get :edit, {:id => facility.to_param}, valid_session
      expect(assigns(:facility)).to eq(facility)
    end
    it "renders the edit template" do
      facility = Facility.create! valid_facility.attributes
      get :edit, {:id => facility.to_param}, valid_session
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before do
      sign_in(create(:user))
    end
    context "with valid params" do
      it "creates a new Facility" do
        expect {
          post :create, {:facility => valid_facility.attributes}, valid_session
        }.to change(Facility, :count).by(1)
      end

      it "assigns a newly created facility as @facility" do
        post :create, {:facility => valid_facility.attributes}, valid_session
        expect(assigns(:facility)).to be_a(Facility)
        expect(assigns(:facility)).to be_persisted
      end

      it "redirects to the created facility" do
        post :create, {:facility => valid_facility.attributes}, valid_session
        expect(response).to redirect_to(Facility.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved facility as @facility" do
        post :create, {:facility => invalid_facility.attributes}, valid_session
        expect(assigns(:facility)).to be_a_new(Facility)
      end

      it "re-renders the 'new' template" do
        post :create, {:facility => invalid_facility.attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before do
      sign_in(create(:user))
    end
    context "with valid params" do
      new_attributes = { name: 'Smithonian'}

      it "updates the requested facility" do
        facility = Facility.create! valid_facility.attributes
        put :update, {:id => facility.to_param, :facility => new_attributes}, valid_session
        facility.reload
        expect(facility.name).to eql new_attributes[:name]
        expect(response).to redirect_to(facility)
      end

      it "assigns the requested facility as @facility" do
        facility = Facility.create! valid_facility.attributes
        put :update, {:id => facility.to_param, :facility => valid_facility.attributes}, valid_session
        expect(assigns(:facility)).to eq(facility)
      end

      it "redirects to the facility" do
        facility = Facility.create! valid_facility.attributes
        put :update, {:id => facility.to_param, :facility => valid_facility.attributes}, valid_session
        expect(response).to redirect_to(facility)
      end
    end

    context "with invalid params" do
      it "assigns the facility as @facility" do
        facility = Facility.create! valid_facility.attributes
        put :update, {:id => facility.to_param, :facility => invalid_facility.attributes}, valid_session
        expect(assigns(:facility)).to eq(facility)
      end

      it "re-renders the 'edit' template" do
        facility = Facility.create! valid_facility.attributes
        put :update, {:id => facility.to_param, :facility => invalid_facility.attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in(create(:user))
    end
    it "destroys the requested facility" do
      facility = Facility.create! valid_facility.attributes
      expect {
        delete :destroy, {:id => facility.to_param}, valid_session
      }.to change(Facility, :count).by(-1)
    end

    it "redirects to the facilities list" do
      facility = Facility.create! valid_facility.attributes
      delete :destroy, {:id => facility.to_param}, valid_session
      expect(response).to redirect_to(facilities_url)
    end
  end

end
