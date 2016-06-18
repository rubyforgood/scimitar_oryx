class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :set_facility, except: [:search]
  before_action :authenticate_user!, except: [:show]

  # GET /animals
  # GET /animals.json
  def index
    @animals = @facility.animals.all
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = @facility.animals.new(facility_id: params[:facility_id])
    @animal.pictures.build
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = @facility.animals.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to facility_animal_path(@facility, @animal) , notice: 'Animal was successfully created.' }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to facility_animal_path(@facility, @animal), notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to facility_animals_path @facility, notice: 'Animal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def set_facility
      @facility = Facility.find(params[:facility_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name,
        :species_id,
        :facility_id,
        :date_of_birth,
        :studbook,
        :transponder,
        :sire,
        :dam,
        :tag,
        :comments,
        :searchable,
        :sex_id,
        :rearing_id,
        :reproductive_status_id,
        pictures_attributes: [:name, :image],
        interests: []
        )
    end
end
