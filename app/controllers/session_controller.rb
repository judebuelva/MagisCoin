class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(contact_num: params[:contact_num])
  #  puts user
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      # session[:user_type] = user.user_type
      redirect_to user
    else
      flash.now.alert = "Invalid contact number or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    # session[:user_type] = nil
    redirect_to users_path, :notice => "Logged out!"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def forget_pin
    user = User.find_by(contact_num: params[:contact_num])
    # user = User.find_by(params[:question_1])
    # user = User.find_by(params[:question_2])
    # user = User.find_by(params[:question_3])
    if user && (user.find_by(params[:question_1]).valid? && user.find_by(params[:question_2]).valid? && user.find_by(params[:question_3]).valid?)
      session[:user_id] = user.id
      user.update(password: params[:password_digest])
    end


  end

end
