class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome!"
    else
      flash.now.alert "Email or password is invalid"
      redirect :new
    end
  end

  def destroy
    session[:user_id] = nil if session[:user_id]
    redirect_to root_url, notice: "Logged Out"
  end
end
