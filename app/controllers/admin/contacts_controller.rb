class Admin::ContactsController < ApplicationController
  layout 'admin'
  def index
    @contacts = Contact.all
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
end