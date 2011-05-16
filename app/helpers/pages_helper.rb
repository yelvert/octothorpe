module PagesHelper
  def link_to_page(page)
    link_to page.title, page_url(:title => page.title_for_url)
  end
end
