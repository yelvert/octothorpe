class Page < ActiveRecord::Base
  include ::Rails.application.routes.url_helpers
  def pretty_path
    page_path(:title => self.title_for_url)
  end
end
