class Api::DriverhistoriesController < Api::ApplicationController
  before_action :set_driverhistory, only: [:show, :update, :destroy]

  # GET /driverhistories.json
  def index
    @driverhistories = Driverhistory.all
  end

  # GET /driverhistories/1.json
  def show
  end

  # POST /driverhistories.json
  def create
    @driverhistory = Driverhistory.new(driverhistory_params)
    respond_to do |format|
      if @driverhistory.save
        format.json { render :show, status: :created, location: @driverhistory }
      else
        format.json { render json: @driverhistory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driverhistories/1.json
  def update
    respond_to do |format|
      if @driverhistory.update(driverhistory_params)
        format.json { render :show, status: :ok, location: @driverhistory }
      else
        format.json { render json: @driverhistory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driverhistories/1.json
  def destroy
    @driverhistory.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driverhistory
      @driverhistory = Driverhistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driverhistory_params
      params.require(:driverhistory).permit(:no_of_incidents)
    end
end
