class PremiaController < ApplicationController
  before_action :set_premium, only: [:show, :edit, :update, :destroy]

  # GET /premia
  def index
    @premia = Premium.all
  end

  # GET /premia/1
  def show
  end

  # GET /premia/new
  def new
    @premium = Premium.new
  end

  # GET /premia/1/edit
  def edit
  end

  # POST /premia
  def create
    @premium = Premium.new()
    @premium.customer_id = session[:customer_id]
    respond_to do |format|
      if @premium.save
        format.html { redirect_to @premium, notice: 'Premium was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /premia/1
  def update
    respond_to do |format|
      if @premium.update(premium_params)
        format.html { redirect_to @premium, notice: 'Premium was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /premia/1
  def destroy
    @premium.destroy
    respond_to do |format|
      format.html { redirect_to premia_url, notice: 'Premium was successfully destroyed.' }
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
