# Offer
#  - relationship that details that an account is offering a book for loan
#
class Offer < ApplicationRecord
  belongs_to :account
  belongs_to :book
end
