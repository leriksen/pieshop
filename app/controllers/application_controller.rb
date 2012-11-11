class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
    end
    @current_user
  end

  def is_admin
    current_user.user_type.is_admin? if current_user
  end

  def is_admin_or_user
    session[:user_id] == params[:user_id] if (session[:user_id] && params[:user_id]) || current_user.user_type.is_admin? if current_user
  end

helper_method :current_user, :is_admin, :is_admin_or_user

  def require_login
    unless current_user
      flash.now.alert = "Action requires you are logged in"
      redirect_to login_url
    end
  end
end
