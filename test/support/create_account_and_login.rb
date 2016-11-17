# create_account_and_login
#  - feature tests helper method for creating and signing a user in
#
def create_account_and_login(email: 'user@example.com', password: 'secret')
  account = Account.create(email: email, password: password)
  visit new_account_session_path
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'secret'
  click_on 'Log in'
  account
end

def create_account_with_contact_and_login(page,
                                          email: 'user@example.com',
                                          password: 'secret',
                                          full_name: 'Bo',
                                          address_line_1: '8 Station Road',
                                          town: 'Wickham')
  account = create_account_and_login(email: email, password: password)

  # I wanted to create the contact at the same time as the account
  # but that hasn't worked out. So I visited the page and filled it
  # in instead.
  Menu.new.visit_account
  click_on('user@example.com')
  ContactPage.new(page).fill(full_name: full_name,
                             address_line_1: address_line_1,
                             address_line_2: '',
                             town: town,
                             county: '',
                             postcode: '').save
  account
end
