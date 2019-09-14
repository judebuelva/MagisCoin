class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(contact_num: params[:contact_num])
  #  puts user
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now.alert = "Invalid contact number or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, :notice => "Logged out!"
  end
end
