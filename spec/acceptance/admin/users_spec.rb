require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature 'Admin::Users' do
  scenario 'Create a new user' do
    login
    visit('/admin/users')
    click_link 'New User'
    fill_in 'Username', :with => 'new_user'
    fill_in 'Password', :with => 'password'
    fill_in 'Password Confirmation', :with => 'password'
    click_button 'Create User'
    visit('/admin/users')
    within('#users') do
      page.should have_content('new_user')
    end
    visit('/admin/logout')
    login_as('new_user', 'password')
    should_be_logged_in
  end
  
  scenario 'Edit an existing admin' do
    new_user = User.create(:name => 'new_user', :password => 'password', :password_confirmation => 'password')
    login
    visit("/admin/users/#{new_user.id}/edit")
    fill_in 'Username', :with => 'edited_user'
    fill_in 'Password', :with => 'changed_password'
    fill_in 'Password Confirmation', :with => 'changed_password'
    click_button 'Update User'
    visit('/admin/users')
    within('#users') do
      page.should_not have_content('new_user')
      page.should have_content('edited_user')
    end
    logout
    login_as('edited_user', 'changed_password')
    should_be_logged_in
  end
  
  scenario 'Delete an exiting page' do
    new_user = User.create(:name => 'new_user', :password => 'password', :password_confirmation => 'password')
    login
    visit('/admin/users')
    within('#users') do
      within("#user_#{new_user.id}") do
        click_link 'Delete'
      end
    end
    page.should_not have_content('new_user')
    visit('/admin/users')
    within('#users') do
      page.should_not have_content('new_user')
    end
  end
end