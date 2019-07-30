class BuyLoadsController < ApplicationController
  before_action :set_buy_load, only: [:show, :edit, :update, :destroy]

  # GET /buy_loads
  # GET /buy_loads.json
  def index
    @buy_loads = BuyLoad.all
  end

  # GET /buy_loads/1
  # GET /buy_loads/1.json
  def show
  end

  # GET /buy_loads/new
  def new
    @buy_load = BuyLoad.new
  end

  # GET /buy_loads/1/edit
  def edit
  end

  # POST /buy_loads
  # POST /buy_loads.json
  def create
    @buy_load = BuyLoad.new(buy_load_params)

    respond_to do |format|
      if @buy_load.save
        format.html { redirect_to @buy_load, notice: 'Buy load was successfully created.' }
        format.json { render :show, status: :created, location: @buy_load }
      else
        format.html { render :new }
        format.json { render json: @buy_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buy_loads/1
  # PATCH/PUT /buy_loads/1.json
  def update
    respond_to do |format|
      if @buy_load.update(buy_load_params)
        format.html { redirect_to @buy_load, notice: 'Buy load was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy_load }
      else
        format.html { render :edit }
        format.json { render json: @buy_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buy_loads/1
  # DELETE /buy_loads/1.json
  def destroy
    @buy_load.destroy
    respond_to do |format|
      format.html { redirect_to buy_loads_url, notice: 'Buy load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_load
      @buy_load = BuyLoad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_load_params
      params.require(:buy_load).permit(:send_id, :recv_id, :amount, :date_time)
    end
end
