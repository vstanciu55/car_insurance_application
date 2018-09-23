class DriverhistoriesController < ApplicationController
  before_action :set_driverhistory, only: [:show, :edit, :update, :destroy]

  # GET /driverhistories
  def index
    @driverhistories = Driverhistory.all
  end

  # GET /driverhistories/1
  def show
  end

  # GET /driverhistories/new
  def new
    @driverhistory = Driverhistory.new
  end

  # GET /driverhistories/1/edit
  def edit
  end

  # POST /driverhistories
  def create
    @driverhistory = Driverhistory.new(driverhistory_params)

    respond_to do |format|
      if @driverhistory.save
        format.html { redirect_to @driverhistory, notice: 'Driverhistory was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /driverhistories/1
  def update
    respond_to do |format|
      if @driverhistory.update(driverhistory_params)
        format.html { redirect_to @driverhistory, notice: 'Driverhistory was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /driverhistories/1
  def destroy
    @driverhistory.destroy
    respond_to do |format|
      format.html { redirect_to driverhistories_url, notice: 'Driverhistory was successfully destroyed.' }
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
