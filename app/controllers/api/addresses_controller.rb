class Api::AddressesController < Api::ApplicationController
  before_action :set_address, only: [:show, :update, :destroy]

  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1.json
  def show
  end


  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.json { render :show, status: :created, location: @address }
      else
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.json { render :show, status: :ok, location: @address }
      else
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:street, :city, :county, :postcode)
    end
end
