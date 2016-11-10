# == Schema Information
#
# Table name: wants
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Want
#  - details an account wanting a book
#
class Want < ApplicationRecord
  belongs_to :book
  belongs_to :account

  scope :by_account, ->(account) { where(account_id: account.id) }
end
