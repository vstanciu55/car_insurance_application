class Api::IncidentsController < Api::ApplicationController
  before_action :set_incident, only: [:show,  :update, :destroy]

  # GET /incidents.json
  def index
    @incidents = Incident.all
  end

  # GET /incidents/1.json
  def show
  end


  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)
    @incident.customer_id = session[:customer_id]
    @driverhistory = Driverhistory.find_by(customer_id: session[:customer_id])
    @driverhistory.increment!(:no_of_incidents)
    respond_to do |format|
      if @incident.save
        format.json { render :show, status: :created, location: @incident }
      else
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.json { render :show, status: :ok, location: @incident }
      else
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:date_of_incident, :value, :type, :description)
    end
end
