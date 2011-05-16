class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login_required
    redirect_to(admin_login_path) unless session[:user]
  end
end
