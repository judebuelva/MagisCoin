class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    # puts User.find(:user_type)
    if session[:user_id] != nil
    # @data = {}
      if current_user.user_type == "A" #doesn't work when logged out
        @users = User.all
      end
    # else
      # @users = nil
      # @data["id"] = current_user.id
    # if current_user.user_type == "M" || current_user.user_type == "C"
    #   @data["f_name"] = current_user.f_name
    #   @data["l_name"] = current_user.l_name
    # elsif current_user.user_type == "A"
    #   @data["user_type"] = current_user.user_type
    # elsif current_user.user_type == "M"
    #   @data["merchant_name"] = current_user.merchant_name
    #   @data["owner_fname"] = current_user.owner_fname
    #   @data["owner_lname"] = current_user.owner_lname
    # end
    #   @data["birthday"] = current_user.birthday
    #   @data["email"] = current_user.email
    #   @data["contact_num"] = current_user.contact_num
    #   @data["address"] = current_user.address
    #   @data["balance"] = current_user.balance
    end


    respond_to do |format|
        format.html
        format.json { render :json => @users }

        # if @users == nil
        #   format.json { render :json => @data }
        # end
      end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    current_user = User.find(params[:id])
    @data = {}
    @data["id"] = current_user.id
  if current_user.user_type == "A" || current_user.user_type == "C"
    @data["f_name"] = current_user.f_name
    @data["l_name"] = current_user.l_name
  elsif current_user.user_type == "A"
    @data["user_type"] = current_user.user_type
  elsif current_user.user_type == "M"
    @data["merchant_name"] = current_user.merchant_name
    @data["owner_fname"] = current_user.owner_fname
    @data["owner_lname"] = current_user.owner_lname
  end
    @data["birthday"] = current_user.birthday
    @data["email"] = current_user.email
    @data["contact_num"] = current_user.contact_num
    @data["address"] = current_user.address
    @data["balance"] = current_user.balance
    @data["password_digest"] = current_user.password_digest
    respond_to do |format|
        format.html
        format.json { render :json =>  @data}
      end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # GET /users/new
  def new
    @user = User.new
  end

  def new_customer
    @user = User.new
  end

  def new_merchant
    @user = User.new
  end

  def new_admin
    @user = User.new
  end

  def buy_load
  end

  def purchase
  end

  def showqr
  end

  def create_customer
      @user = User.new
      @user.f_name = params[:user][:f_name].capitalize
      @user.l_name = params[:user][:l_name].capitalize
      @user.birthday = nil #params[:user][:birthday]
      @user.role = nil
      @user.merchant_name = nil
      @user.owner_fname = nil
      @user.owner_lname = nil
      @user.email = params[:user][:email]
      @user.contact_num = params[:user][:contact_num]
      @user.address = params[:user][:address]
      @user.balance = 0.0
      @user.user_type = "C"
      @user.password = params[:user][:password_digest]
      @user.question_1 = Digest::SHA1.hexdigest params[:user][:question_1]
      @user.question_2 = Digest::SHA1.hexdigest params[:user][:question_2]
      @user.question_3 = Digest::SHA1.hexdigest params[:user][:question_3]
      #all fields that should be null (nil) or 0
     respond_to do |format|
       if @user.save
         format.html { redirect_to @user, notice: 'Consumer was successfully created.' }
         format.json { render :show, status: :created, location: @user }
       else
         format.html { render :new }
         format.json { render json: @user.errors, status: :unprocessable_entity }
       end
     end
  end

  def create_merchant
      @user = User.new
      @user.f_name = nil
      @user.l_name = nil
      @user.birthday = nil #params[:user][:birthday]
      @user.role = nil
      @user.password = params[:user][:password_digest]
      @user.merchant_name = params[:user][:merchant_name].capitalize
      @user.owner_fname = params[:user][:owner_fname].capitalize
      @user.owner_lname = params[:user][:owner_lname].capitalize
      @user.email = params[:user][:email]
      @user.contact_num = params[:user][:contact_num]
      @user.address = params[:user][:address]
      @user.balance = 0.0
      @user.user_type = "M"
      @user.question_1 = Digest::SHA1.hexdigest params[:user][:question_1]
      @user.question_2 = Digest::SHA1.hexdigest params[:user][:question_2]
      @user.question_3 = Digest::SHA1.hexdigest params[:user][:question_3]
      #all fields that should be null (nil) or 0
     respond_to do |format|
       if @user.save
         format.html { redirect_to @user, notice: 'Merchant was successfully created.' }
         format.json { render :show, status: :created, location: @user }
       else
         format.html { render :new }
         format.json { render json: @user.errors, status: :unprocessable_entity }
       end
     end

  end

  def create_admin
      @user = User.new(user_params)
      @user.f_name = params[:user][:f_name].capitalize
      @user.l_name = params[:user][:l_name].capitalize
      @user.birthday = nil
      @user.role = params[:user][:role].capitalize
      @user.password = params[:user][:password_digest]
      @user.merchant_name = nil
      @user.owner_fname = nil
      @user.owner_lname = nil
      @user.email = params[:user][:email]
      @user.contact_num = params[:user][:contact_num]
      @user.address = params[:user][:address]
      @user.balance = 0.0
      @user.user_type = "A"
      @user.question_1 = Digest::SHA1.hexdigest params[:user][:question_1]
      @user.question_2 = Digest::SHA1.hexdigest params[:user][:question_2]
      @user.question_3 = Digest::SHA1.hexdigest params[:user][:question_3]
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'Admin was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  def buyload
    @user = User.find(params[:id])
    prev_balance = @user.balance
    @user.update( balance: prev_balance.to_f + params[:balance].to_f )

    @transaction = Transaction.new()
    @transaction.send_id = current_user.id
    @transaction.recv_id = params[:id]
    @transaction.card_id = nil
    @transaction.purchase_type = "Buy Load"
    @transaction.amount = params[:balance].to_f
    @transaction.time_recorded = DateTime.now
    @transaction.save
    puts @user.errors.full_messages
    redirect_to users_path
    flash[:notice] = 'User Successfully Loaded!'
    rescue ActiveRecord::RecordNotFound => e
    print e
    # @js_response = ActiveSupport::JSON.encode(@user, @transaction)
    respond_to do |format|
      if @transaction.save
         format.html { redirect_to @user, notice: 'Account Loaded!' }
         format.json { render :show, status: :created, location: @user }
       else
         format.html { render :new }
         format.json { render json: @user.errors, status: :unprocessable_entity }
       end
    end
  end

  def withdraw
    @user = User.find(params[:id])
    if @user.balance.to_f >= params[:balance].to_f
      prev_balance = @user.balance
      @user.update( balance: prev_balance.to_f - params[:balance].to_f )

      @transaction = Transaction.new()
      @transaction.send_id = current_user.id
      @transaction.recv_id = params[:id]
      @transaction.card_id = nil
      @transaction.purchase_type = "Withdrawal"
      @transaction.amount = params[:balance].to_f
      @transaction.time_recorded = DateTime.now
      # @transaction.save
      respond_to do |format|
        if @transaction.save
           format.html { redirect_to users_path, notice: 'Withdrawn!' }
           format.json { render :show, status: :created, location: @user }
        else
           format.html { render :new }
           format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
      puts @user.errors
      # redirect_to users_path
      flash[:notice] = 'User Successfully Withdrawn!'
    else
      redirect_to with_draw_path
      flash[:alert] = 'Insufficient Funds to Withdraw!'

     end
  end

  def payment
    @user = User.find(current_user.id)
      if @user.balance.to_f >= params[:balance].to_f
          send_prev = @user.balance
          @user.update( balance: send_prev.to_f - params[:balance].to_f )

          @user = 0

          @user = User.find(params[:id])
          recv_prev = @user.balance
          @user.update( balance: recv_prev.to_f + params[:balance].to_f )
          puts @user.errors.full_messages

          @transaction = Transaction.new()
          @transaction.send_id = current_user.id
          @transaction.recv_id = params[:id]
          @transaction.card_id = nil
          @transaction.purchase_type = "Send Load"
          @transaction.amount = params[:balance].to_f
          @transaction.time_recorded = DateTime.now
          # @transaction.save
          puts @user.errors
          # redirect_to users_path
          flash[:success] = 'Payment Successful!'
          respond_to do |format|
            if @transaction.save
               format.html { redirect_to users_path, notice: 'Payment Sent!' }
               format.json { render :show, status: :created, location: @user }
             else
               format.html { render :new }
               format.json { render json: @user.errors, status: :unprocessable_entity }
             end
           end
      else
          redirect_to payment_path
          flash[:alert] = 'Insufficient Funds to Pay!'
          # format.json { render json: "Insufficient Funds", status: :unprocessable_entity }
      end
  end

  def show_qr
    @user = User.find(current_user.id)
  end

  def forget_pin
    @user = User.find_by(contact_num: params[:contact_num])
    q1 = Digest::SHA1.hexdigest params[:question_1].to_s
    q2 = Digest::SHA1.hexdigest params[:question_2].to_s
    q3 = Digest::SHA1.hexdigest params[:question_3].to_s
    if @user && q1 && q2 && q3
      @user.update(password: params[:password_digest])
      redirect_to login_path
    end
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    @transaction = Transaction.where(send_id: params[:id]) || Transaction.where(recv_id: params[:id])
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getname
    @user = User.find(params[:id])
    respond_to do |format|
      format.json{ render json: @user }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # def set_num
    #   @user = User.find_by(params[:contact_num])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:f_name, :l_name, :birthday, :role, :merchant_name, :owner_fname, :owner_lname, :email, :contact_num, :address, :balance, :user_type, :password_digest)
    end
  end
