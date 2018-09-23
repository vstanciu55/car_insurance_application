class Api::OccupationsController < Api::ApplicationController
  before_action :set_occupation, only: [:show,  :update, :destroy]

  # GET /occupations.json
  def index
    @occupations = Occupation.all
  end

  # GET /occupations/1.json
  def show
  end


  # POST /occupations.json
  def create
    @occupation = Occupation.new(occupation_params)

    respond_to do |format|
      if @occupation.save
        format.json { render :show, status: :created, location: @occupation }
      else
        format.json { render json: @occupation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occupations/1.json
  def update
    respond_to do |format|
      if @occupation.update(occupation_params)
        format.json { render :show, status: :ok, location: @occupation }
      else
        format.json { render json: @occupation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occupations/1.json
  def destroy
    @occupation.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occupation
      @occupation = Occupation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occupation_params
      params.require(:occupation).permit(:name)
    end
end
