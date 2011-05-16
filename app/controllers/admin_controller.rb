class AdminController < ApplicationController
  layout 'admin'
  
  def index
    if !session[:user]
      render :login
    else
      
    end
  end
  
  def login
    if params[:user]
      user = User.where(:name => params[:user][:name]).first
      if user and user.authenticate(params[:user][:password])
        session[:user] = user
      end
      redirect_to admin_url
    end
  end
  
  def logout
    session[:user] = nil
    redirect_to root_url
  end
end