require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature 'Admin::Contacts' do
  scenario 'Check user sent contacts' do
    contacts = []
    5.times do |i|
      contacts << Contact.create(:name => "Person #{i}", :email => "person_#{i}@test.com", :subject => "User contact #{i}", :content => "Hey whats up from person #{i}!")
    end
    login
    visit('/admin/contacts')
    within('#contacts') do
      contacts.each do |contact|
        within("#contact_#{contact.id}") do
          page.should have_content(contact.name)
          page.should have_content(contact.email)
          page.should have_content(contact.subject)
        end
      end
    end
  end
  
  scenario 'View a user sent contact' do
    new_contact = Contact.create(:name => 'John Doe', :email => 'john.doe@test.com', :subject => 'User contact', :content => 'Hey whats up!')
    login
    visit("/admin/contacts/#{new_contact.id}")
    page.should have_content('John Doe')
    page.should have_content('john.doe@test.com')
    page.should have_content('User contact')
    page.should have_content('Hey whats up!')
  end
  
  scenario 'Delete a contact' do
    new_contact = Contact.create(:name => 'John Doe', :email => 'john.doe@test.com', :subject => 'User contact', :content => 'Hey whats up!')
    login
    visit('/admin/contacts')
    within('#contacts') do
      within("#contact_#{new_contact.id}") do
        click_link 'Delete'
      end
    end
    page.should_not have_content('John Doe')
    visit('/admin/contacts')
    within('#contacts') do
      page.should_not have_content('John Doe')
    end
  end
end