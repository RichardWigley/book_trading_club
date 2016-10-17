# Book
#  - represents book information
#
class Book < ApplicationRecord
  validates :author, :title, presence: true

  scope :ordered, -> { order('title DESC') }
end
