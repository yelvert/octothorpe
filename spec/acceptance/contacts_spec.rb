require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Contacts" do
  scenario "User sends us a contact" do
    Rails.logger.info "CHOG"
    visit("/contacts/new")
    fill_in 'Name', :with => 'John Smith'
    fill_in 'Email', :with => 'john@smith.com'
    fill_in 'Subject', :with => 'Contact'
    fill_in 'Message', :with => 'Hey, whats up?'
    click_button 'Send'
    page.should have_content('Thanks for your message!')
    contact = Contact.first
    contact.name.should eql('John Smith')
    contact.email.should eql('john@smith.com')
    contact.subject.should eql('Contact')
    contact.content.should eql('Hey, whats up?')
  end
end