# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  account_id :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Offer
#  - relationship that details that an account is offering a book for loan
#
class Offer < ApplicationRecord
  belongs_to :account
  belongs_to :book

  scope :by_account, ->(account) { where(account_id: account.id) }
end
