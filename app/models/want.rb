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
  has_one :trade
  belongs_to :book
  belongs_to :account
  validate :account_already_offers_book

  def account_already_offers_book
    return if account.offers.by_book(book).empty?

    errors.add(:already_offers_the_book, '- You cannot want a book that you offer.')
  end

  scope :by_account, ->(account) { where(account_id: account.id) }
  scope :by_book, ->(book) { where(book_id: book.id) }
  scope :untraded, -> { left_outer_joins(:trade).where(trades: { id: nil }) }
end
