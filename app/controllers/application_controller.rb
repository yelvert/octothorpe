class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login_required
    redirect_to(admin_login_path) unless session[:user]
  end
  
  def page_not_found
    render :file => "#{Rails.root}/public/404.html", :status => :not_found, :layout => false
  end
end
