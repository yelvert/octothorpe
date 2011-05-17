class PagesController < ApplicationController
  def show
    @page = Page.where(:title_for_url => (params[:title] || 'home')).first
    page_not_found
  end
end
