module HelperMethods
  def login
    name = 'admin'
    password = 'abcd1234'
    User.create(:name => name, :password => password, :password_confirmation => password)
    visit('/admin')
    fill_in 'Username', :with => name
    fill_in 'Password', :with => password
    click_button 'Login'
    should_be_logged_in
  end
  
  def login_as(name, password)
    visit('/admin')
    fill_in 'Username', :with => name
    fill_in 'Password', :with => password
    click_button 'Login'
  end
  
  def should_be_logged_in
    current_path = URI.parse(current_url).path
    visit('/admin')
    page.should have_content('View Public Site')
    visit(current_path)
  end
  
  def logout
    visit('/admin/logout')
  end
  
  def should_not_find_page
    page.status_code.should eql(404)
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
