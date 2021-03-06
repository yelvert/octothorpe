class Admin::ContactsController < ApplicationController
  before_filter :login_required
  layout 'admin'
  
  def index
    @contacts = Contact.all
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
  end
end