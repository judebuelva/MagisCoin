class QrsController < ApplicationController
  before_action :set_qr, only: [:show, :edit, :update, :destroy]

  # GET /qrs
  # GET /qrs.json
  def index
    @qrs = Qr.all
    render json: @qrs, status: :ok
  end
  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # GET /qrs/1
  # GET /qrs/1.json
  def show
  end

  # GET /qrs/new
  def new
    @qr = Qr.new
  end

  # GET /qrs/1/edit
  def edit
  end

  # POST /qrs
  # POST /qrs.json
  def create
    @qr = Qr.new(qr_params)

    @qr.user_id = current_user.id

    @qr.uniq_id = Digest::SHA1.hexdigest([Time.now, rand].join)

    respond_to do |format|
      if @qr.save
        format.html { redirect_to @qr, notice: 'Qr was successfully created.' }
        format.json { render :show, status: :created, location: @qr }
      else
        format.html { render :new }
        format.json { render json: @qr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qrs/1
  # PATCH/PUT /qrs/1.json
  def update
    respond_to do |format|
      if @qr.update(qr_params)
        format.html { redirect_to @qr, notice: 'Qr was successfully updated.' }
        format.json { render :show, status: :ok, location: @qr }
      else
        format.html { render :edit }
        format.json { render json: @qr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qrs/1
  # DELETE /qrs/1.json
  def destroy
    @qr.destroy
    respond_to do |format|
      format.html { redirect_to qrs_url, notice: 'Qr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qr
      @qr = Qr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qr_params
      # params.require(:qr).permit(:user_id)
    end
end
