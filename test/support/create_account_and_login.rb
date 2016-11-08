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
