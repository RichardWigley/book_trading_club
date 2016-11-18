# account_create
#  - create an account or return one with the same email
#    - email is unique
#  - used throughout test/models
#
module Factory
  def account_create(email: 'user@example.com', password: 'password')
    Account.find_or_create_by(email: email) do |acc|
      acc.password = password
      acc.password_confirmation = password
    end
  end
end
