class Api::CustomersController < Api::ApplicationController
  before_action :set_customer, only: [:show,  :update, :destroy]

  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1.json
  def show
  end


  # POST /customers.json
  def create
    logger.debug "New post: #{customer_params[:address]}"
    @customer = Customer.new()
    @customer.title =  customer_params[:title]
    @customer.forename =  customer_params[:forename]
    @customer.surname =  customer_params[:surname]
    @customer.email =  customer_params[:email]
    @customer.date_of_birth =  customer_params[:date_of_birth]
    @customer.license_period =  customer_params[:license_period]
    @customer.job_title =  customer_params[:job_title]
    @customer.current_license_type =  customer_params[:current_license_type]
    @address = Address.create(customer_params[:address])
    @customer.address = @address

    # @customer.occupation = Occupation.find_by name: params[:name]

    

    respond_to do |format|
      if @customer.save
        format.json { render @customer, status: :created, location: @customer }
      else
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
    session[:customer_id] = @customer.id
  end

  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.json { render :show, status: :ok, location: @customer }
      else
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:title, :forename, :surname, :email, :date_of_birth, :license_period, :job_title, :occupation_id, :current_license_type, address: [:street, :city, :county, :postcode])
    end
    # def customer_params
    #   params.require(:customer).permit(:title, :forename, :surname, :email, :date_of_birth, :license_period, :street, :city, :county, :postcode, :job_title, :occupation_id, :current_license_type)
    # end
    def address_params
      params.permit(:street, :city, :county, :postcode)
    end
    def occupation_params
      params.permit(:name, :occupation_id)
    end
    
    
    
end
