class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login_required
    redirect_to(admin_login_path) unless current_user
  end
  
  def page_not_found
    render :file => "#{Rails.root}/public/404.html", :status => :not_found, :layout => false
  end
  
  def current_user
    User.find(session[:user_id]) rescue nil
  end
end
