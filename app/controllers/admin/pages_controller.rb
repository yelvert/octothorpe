class Admin::PagesController < ApplicationController
  before_filter :login_required
  layout 'admin'
  
  def index
    @pages = Page.all
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to(admin_pages_url)
    else
      render 'new'
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to(admin_pages_url)
    else
      render 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(admin_pages_url)
  end
end