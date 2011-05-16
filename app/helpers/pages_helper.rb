module PagesHelper
  def link_to_page(page)
    link_to page.title, page.pretty_path
  end
end
