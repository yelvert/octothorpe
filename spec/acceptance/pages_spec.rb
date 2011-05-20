require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Pages" do
  scenario "Go to home page" do
    Page.destroy_all
    home = Page.create(:title => "Home", :title_for_url => "home", :content => "Welcome home!")
    visit("/home")
    page.should have_content("Welcome home!")
  end
end