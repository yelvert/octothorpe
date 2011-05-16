class Admin::UsersController < ApplicationController
  layout 'admin'
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(admin_users_url)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(admin_users_url)
    else
      render 'new'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(admin_users_url)
  end
end