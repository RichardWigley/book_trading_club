# Want
#  - details an account wanting a book
#
class Want < ApplicationRecord
  belongs_to :book
  belongs_to :account
end
