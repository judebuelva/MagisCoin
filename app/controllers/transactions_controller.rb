class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    if current_user.user_type == "A"
      @transactions = Transaction.all
      @transactions = Transaction.where(["time_recorded LIKE ?","%#{params[:search]}%"])
      # @transactions = Transaction.where(["send_id LIKE ?","%#{params[:search]}%"])
      # @transactions = Transaction.where(["recv_id LIKE ?","%#{params[:search]}%"])
    else
    @transactions = Transaction.all
    # elsif current_user.user_type == "M" || current_user.user_type == "C"
    #   if Transaction.where(send_id: current_user.id)
    #     @transactions = Transaction.where(send_id: current_user.id)#.select(:send_id)# && Transaction.where(recv_id: current_user.id)
    #   elsif Transaction.where(recv_id: current_user.id)
    #     @transactions = Transaction.where(recv_id: current_user.id)#.select(:recv_id)
    #   end
    # elsif Transaction.where(recv_id: current_user.id)
    #   @transaction = Transaction.where(recv_id: current_user.id)
    end
    respond_to do |format|
      format.html
      format.json {render :json => @transactions}
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transactions = Transaction.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @transactions}
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:send_id, :recv_id, :card_id, :purchase_type, :amount, :time_recorded)
    end
end
