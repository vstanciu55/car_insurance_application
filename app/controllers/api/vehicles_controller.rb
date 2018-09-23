class Api::VehiclesController < Api::ApplicationController
  before_action :set_vehicle, only: [:show,  :update, :destroy]

  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1.json
  def show
  end

  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.customer_id = session[:customer_id]
    respond_to do |format|
      if @vehicle.save
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:vehicle_registration, :estimated_annual_mileage, :estimated_vehicle_value, :typical_parking_location, :policy_start_date)
    end
end
