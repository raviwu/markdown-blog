class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user

  def index
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      flash[:danger] = "Please Login First."
      redirect_to login_path
    end
  end
end
