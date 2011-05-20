require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature 'Admin' do
  scenario 'login' do
    login
    should_be_logged_in
  end
end