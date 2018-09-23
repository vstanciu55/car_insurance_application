class Api::PremiaController < Api::ApplicationController
  before_action :set_premium, only: [:show, :update, :destroy]

  # GET /premia.json
  def index
    @premia = Premium.all
  end

  # GET /premia/1.json
  def show
  end

  # POST /premia.json
  def create
    @premium = Premium.new()
    @premium.customer_id = session[:customer_id]
    respond_to do |format|
      if @premium.save
        format.json { render :show, status: :created, location: @premium }
      else
        format.json { render json: @premium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premia/1.json
  def update
    respond_to do |format|
      if @premium.update(premium_params)
        format.json { render :show, status: :ok, location: @premium }
      else
        format.json { render json: @premium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premia/1.json
  def destroy
    @premium.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premium
      @premium = Premium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premium_params
      params.require(:premium).permit(:value)
    end
end
