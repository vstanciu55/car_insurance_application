class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)
    @address = Address.create(address_params)
    @customer.address = @address

    

    # logger.debug "New post: #{params[:name]}"
    # @customer.occupation = Occupation.find_by name: params[:name]

    

    respond_to do |format|
      if @customer.save

        format.html {redirect_to :controller => 'vehicles', :action => 'new', notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
    session[:customer_id] = @customer.id

    Driverhistory.create(customer_id: session[:customer_id], no_of_incidents: 0)
  end

  # PATCH/PUT /customers/1
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:title, :forename, :surname, :email, :date_of_birth, :license_period, :street, :city, :county, :postcode, :job_title, :occupation_id, :current_license_type)
    end
    def address_params
      params.permit(:street, :city, :county, :postcode)
    end
    def driverhistory_params
      params.permit(:no_of_incidents, :customer_id)
    end
    
    
    
end
