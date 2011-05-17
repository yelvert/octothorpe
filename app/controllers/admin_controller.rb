class AdminController < ApplicationController
  layout 'admin'
  
  def index
    render :login unless current_user
  end
  
  def login
    if params[:user]
      user = User.where(:name => params[:user][:name]).first
      if user and user.authenticate(params[:user][:password])
        session[:user_id] = user.id
      end
      redirect_to admin_url
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to root_url
  end
end