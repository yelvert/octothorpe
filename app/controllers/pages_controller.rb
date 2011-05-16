class PagesController < ApplicationController
  def show
    @page = Page.where(:title_for_url => (params[:title] || 'home')).first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end
end
