class FacilitiesController < ApplicationController
  before_action :set_facility_user
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  # GET /facilities
  # GET /facilities.json
  def index
    @facilities = Facility.all
  end

  # GET /facilities/1
  # GET /facilities/1.json
  def show
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
    @facility.facilities_users.build
    @facility.pictures.build
  end

  # GET /facilities/1/edit
  def edit
  end

  # POST /facilities
  # POST /facilities.json
  def create
    @facility = Facility.new(facility_params)

    respond_to do |format|
      if @facility.save
        format.html { redirect_to @facility, notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @facility }
      else
        format.html { render :new }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1
  # PATCH/PUT /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.json
  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to facilities_url, notice: 'Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      if current_user.site_admin? || action_name == 'show'
        @facility = Facility.find(params[:id])
      else # restrict edit/update/destroy to only facilities associated with the user.
        begin
          @facility = current_user.facilities.find(params[:id])
        rescue
          render_not_found('Sorry, that facility could not be found.')
        end
      end
    end

    def set_facility_user
      @facility_user = FacilityUser.find_by(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_params
      params.require(:facility).permit(
        :name,
        :approved,
        :facility_type_id,
        :spa,
        :acreage,
        :endangered_acreage,
        :temperture_controled,
        :water_features,
        :supplemental_feed,
        expertise: [],
        interests: [],
        pictures_attributes: [:name, :image],
        facilities_users_attributes: [:user_id, :facility_id]
      )
    end
end
