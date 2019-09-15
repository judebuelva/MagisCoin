class ReceiveLoadsController < ApplicationController
  before_action :set_receive_load, only: [:show, :edit, :update, :destroy]

  # GET /receive_loads
  # GET /receive_loads.json
  def index
    @receive_loads = ReceiveLoad.all
  end
  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # GET /receive_loads/1
  # GET /receive_loads/1.json
  def show
  end

  # GET /receive_loads/new
  def new
    @receive_load = ReceiveLoad.new
  end

  # GET /receive_loads/1/edit
  def edit
  end

  # POST /receive_loads
  # POST /receive_loads.json
  def create
    @receive_load = ReceiveLoad.new(receive_load_params)

    respond_to do |format|
      if @receive_load.save
        format.html { redirect_to @receive_load, notice: 'Receive load was successfully created.' }
        format.json { render :show, status: :created, location: @receive_load }
      else
        format.html { render :new }
        format.json { render json: @receive_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receive_loads/1
  # PATCH/PUT /receive_loads/1.json
  def update
    respond_to do |format|
      if @receive_load.update(receive_load_params)
        format.html { redirect_to @receive_load, notice: 'Receive load was successfully updated.' }
        format.json { render :show, status: :ok, location: @receive_load }
      else
        format.html { render :edit }
        format.json { render json: @receive_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receive_loads/1
  # DELETE /receive_loads/1.json
  def destroy
    @receive_load.destroy
    respond_to do |format|
      format.html { redirect_to receive_loads_url, notice: 'Receive load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receive_load
      @receive_load = ReceiveLoad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receive_load_params
      params.require(:receive_load).permit(:send_id, :recv_id, :amount, :date_time)
    end
end
