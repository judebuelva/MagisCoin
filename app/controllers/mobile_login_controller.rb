class MobileLoginController < ApplicationController

  def login
    user = User.find_by(contact_num: params[:contact_num])

    if user && user.authenticate(params[:password])

      render json: {"ID" => user.id}
    else
      render json: {"error" => "Invalid"}
    end
  end

  def mprofile
    @user = User.find(user.id)

    @user = User.balance
    @user = User.f_name
    @user = User.l_name
  end

  def mcreate_customer
      @user = User.new
      @user.f_name = params[:f_name]
      @user.l_name = params[:l_name]
      @user.birthday = params[:birthday]
      @user.role = nil
      @user.merchant_name = nil
      @user.owner_fname = nil
      @user.owner_lname = nil
      @user.email = params[:email]
      @user.contact_num = params[:contact_num]
      @user.address = params[:address]
      @user.balance = 0.0
      @user.user_type = "C"
      @user.password = params[:password_digest]
      # @user.question_1 = params[:user][:question_1]
      # @user.question_2 = params[:user][:question_2]
      # @user.question_3 = params[:user][:question_3]
      #all fields that should be null (nil) or 0
       if @user.save
         render json: {"Registration" => "Created Successfully"}
       else
         render json: {"error" => "Invalid"}
       end
  # respond_to do |format|
  #      format.json { render json: @user.errors, status: :unprocessable_entity }
  #  end
  end

  def mpayment
    @user = User.find(user.id)
      if @user.balance.to_f >= params[:balance].to_f
          send_prev = @user.balance
          @user.update( balance: send_prev.to_f - params[:balance].to_f )

          @user = 0

          @user = User.find(params[:id])
          recv_prev = @user.balance
          @user.update( balance: recv_prev.to_f + params[:balance].to_f )
          puts @user.errors.full_messages

          @transaction = Transaction.new()
          @transaction.send_id = user.id
          @transaction.recv_id = params[:id]
          @transaction.card_id = nil
          @transaction.purchase_type = "Send Load"
          @transaction.amount = params[:balance].to_f
          @transaction.time_recorded = DateTime.now
          # @transaction.save
          puts @user.errors
          # redirect_to users_path
          flash[:success] = 'Payment Successful!'
            if @transaction.save
               render.json { "Transaction" => "Created Successfully" }
             else
              render.json { "Error" => "Invalid Transaction" }
            end
        else
            render.json {"Error" => "Insufficient Funds to Pay!"}
            # format.json { render json: "Insufficient Funds", status: :unprocessable_entity }
        end
    end

    def mtransactions
      @transaction = Transaction.all

      render.json{ @transaction }
    end

    def mlogout

    end
end
