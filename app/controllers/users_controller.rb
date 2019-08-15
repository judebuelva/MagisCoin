class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
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

  def create_customer
      @user = User.new
      @user.f_name = params[:user][:f_name]
      @user.l_name = params[:user][:l_name]
      @user.birthday = params[:user][:birthday]
      @user.role = nil
      @user.merchant_name = nil
      @user.owner_fname = nil
      @user.owner_lname = nil
      @user.email = params[:user][:email]
      @user.contact_num = params[:user][:contact_num]
      @user.address = params[:user][:address]
      @user.balance = 0.0
      @user.user_type = "C"
      #all fields that should be null (nil) or 0
      @user.save
      redirect_to "/users/"
  end

  def create_merchant
      @user = User.new
      @user.f_name = nil
      @user.l_name = nil
      @user.birthday = nil
      @user.role = nil
      @user.merchant_name = params[:user][:merchant_name]
      @user.owner_fname = params[:user][:owner_fname]
      @user.owner_lname = params[:user][:owner_lname]
      @user.email = params[:user][:email]
      @user.contact_num = params[:user][:contact_num]
      @user.address = params[:user][:address]
      @user.balance = 0.0
      @user.user_type = "M"
      #all fields that should be null (nil) or 0
      @user.save
      redirect_to "/users/"
  end

  def create_admin
      @user = User.new(user_params)
      @user.f_name = params[:user][:f_name]
      @user.l_name = params[:user][:l_name]
      @user.birthday = nil
      @user.role = params[:user][:role]
      @user.merchant_name = nil
      @user.owner_fname = nil
      @user.owner_lname = nil
      @user.email = params[:user][:email]
      @user.contact_num = params[:user][:contact_num]
      @user.address = params[:user][:address]
      @user.balance = 0.0
      @user.user_type = "A"
      @user.save
      redirect_to "/users/"
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
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:f_name, :l_name, :birthday, :role, :merchant_name, :owner_fname, :owner_lname, :email, :contact_num, :address, :balance, :user_type)
    end
  end
