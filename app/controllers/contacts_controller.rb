class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to(root_path)
    else
      render 'new', :notice => "Something went wrong."
    end
  end
end