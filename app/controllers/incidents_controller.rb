class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  # GET /incidents
  def index
    @incidents = Incident.all
  end

  # GET /incidents/1
  def show
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
  end

  # GET /incidents/1/edit
  def edit
  end

  # POST /incidents
  def create
    @incident = Incident.new(incident_params)
    @incident.customer_id = session[:customer_id]
    @driverhistory = Driverhistory.find_by(customer_id: session[:customer_id])
    @driverhistory.increment!(:no_of_incidents)
    if params[:calculate_premium]
      respond_to do |format|
        if @incident.save
          premium_value = @driverhistory.no_of_incidents * 1000
          @premium = Premium.create(customer_id: session[:customer_id], value: premium_value)
          format.html { redirect_to @premium, notice: 'Incident was successfully created.' }
        else
          format.html { render :new }
        end
      end   
    else
      respond_to do |format|
        if @incident.save
          format.html { redirect_to :controller => 'incidents', :action => 'new', notice: 'Incident was successfully created.' }
        else
          format.html { render :new }
        end
      end       
    end

    # respond_to do |format|
    #   if @incident.save
    #     format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
    #   else
    #     format.html { render :new }
    #   end
    # end
  end

  # PATCH/PUT /incidents/1
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /incidents/1
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:date_of_incident, :value, :type_of_incident, :description)
    end
end
