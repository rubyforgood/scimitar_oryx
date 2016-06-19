class AnimalMatchesController < ApplicationController
  before_action :set_animal_match, only: [:show, :edit, :update, :destroy]

  # GET /animal_matches
  # GET /animal_matches.json
  def index
    @animal_matches = AnimalMatch.all
  end

  # GET /animal_matches/1
  # GET /animal_matches/1.json
  def show
  end

  # GET /animal_matches/new
  def new
    @animal_match = AnimalMatch.new
  end

  # GET /animal_matches/1/edit
  def edit
  end

  # POST /animal_matches
  # POST /animal_matches.json
  def create
    @animal_match = AnimalMatch.new(animal_match_params)

    respond_to do |format|
      if @animal_match.save
        format.html { redirect_to @animal_match, notice: 'Animal match was successfully created.' }
        format.json { render :show, status: :created, location: @animal_match }
      else
        format.html { render :new }
        format.json { render json: @animal_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animal_matches/1
  # PATCH/PUT /animal_matches/1.json
  def update
    respond_to do |format|
      if @animal_match.update(animal_match_params)
        format.html { redirect_to @animal_match, notice: 'Animal match was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal_match }
      else
        format.html { render :edit }
        format.json { render json: @animal_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animal_matches/1
  # DELETE /animal_matches/1.json
  def destroy
    @animal_match.destroy
    respond_to do |format|
      format.html { redirect_to animal_matches_url, notice: 'Animal match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_match
      @animal_match = AnimalMatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_match_params
      params.require(:animal_match).permit(:animal_id, :potential_mate_id)
    end
end
