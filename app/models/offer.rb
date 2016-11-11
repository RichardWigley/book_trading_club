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
  has_one :trade
  belongs_to :account
  belongs_to :book
  validate :account_already_wants_book

  def account_already_wants_book
    return if account.wants.by_book(book).empty?

    errors.add(:already_want_the_book, '- You cannot offer a book that you want.')
  end

  scope :by_account, ->(account) { where(account_id: account.id) }
  scope :by_book, ->(book) { where(book_id: book.id) }
end
