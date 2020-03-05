class NfcController < ApplicationController
  def login
    user = User.find_by(contact_num: params[:contact_num])

    if user && user.authenticate(params[:password])

      render json: {"ID" => user.id}
    else
      render json: {"error" => "Invalid"}
    end
  end

  def nfcprofile
    
  end

  def nfcpayment
    @user = User.find(params[:send_id])
      if @user.balance.to_f >= params[:balance].to_f
          send_prev = @user.balance
          @user.update( balance: send_prev.to_f - params[:balance].to_f )

          @user = 0

          @user = User.find(params[:recv_id])
          recv_prev = @user.balance
          @user.update( balance: recv_prev.to_f + params[:balance].to_f )
          puts @user.errors.full_messages

          @transaction = Transaction.new()
          @transaction.send_id = params[:send_id] #customer
          @transaction.recv_id = params[:recv_id] #merchant
          @transaction.card_id = nil
          @transaction.purchase_type = "Send Load"
          @transaction.amount = params[:balance].to_f
          @transaction.time_recorded = DateTime.now
          # @transaction.save
          puts @user.errors
          # redirect_to users_path
          flash[:success] = 'Payment Successful!'
            if @transaction.save
               render json: { "Transaction" => "Created Successfully" }
             else
              render json: { "Error" => "Invalid Transaction" }
            end
        else
            render json: {"Error" => "Insufficient Funds to Pay!"}
            # format.json { render json: "Insufficient Funds", status: :unprocessable_entity }
        end
    end
end
