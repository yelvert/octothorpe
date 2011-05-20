require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature 'Admin::Pages' do
  scenario 'Create a new page' do
    login
    visit('/admin/pages')
    click_link 'New Page'
    fill_in 'Title', :with => 'New Page'
    fill_in 'Title for URL', :with => 'new-page'
    fill_in 'Content', :with => 'This is a new page.'
    click_button 'Create Page'
    visit('/admin/pages')
    within('#pages') do
      page.should have_content('New Page')
      page.should have_content('new-page')
    end
    visit('/new-page')
    Rails.logger.info Page.all.inspect
    page.should have_content('New Page')
    page.should have_content('This is a new page.')
  end
  
  scenario 'Edit an existing page' do
    new_page = Page.create(:title => 'New Page', :title_for_url => 'new-page', :content => 'This is a new page')
    login
    visit("/admin/pages/#{new_page.id}/edit")
    fill_in 'Title', :with => 'Updated Page'
    fill_in 'Title for URL', :with => 'updated-page'
    fill_in 'Content', :with => 'This is an updated page.'
    click_button 'Update Page'
    visit('/admin/pages')
    within('#pages') do
      page.should_not have_content('New Page')
      page.should_not have_content('new-page')
      page.should have_content('Updated Page')
      page.should have_content('updated-page')
    end
    visit('/updated-page')
    page.should have_content('Updated Page')
    page.should have_content('This is an updated page.')
  end
  
  scenario 'Delete an exiting page' do
    new_page = Page.create(:title => 'New Page', :title_for_url => 'new-page', :content => 'This is a new page')
    login
    visit('/admin/pages')
    within('#pages') do
      within("#page_#{new_page.id}") do
        click_link 'Delete'
      end
    end
    page.should_not have_content('new-page')
    visit('/admin/pages')
    within('#pages') do
      page.should_not have_content('new-page')
    end
  end
end