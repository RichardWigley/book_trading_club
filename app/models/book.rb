# Book
#  - represents book information
#
class Book < ApplicationRecord
  include PgSearch
  validates :author, :title, presence: true

  scope :ordered, -> { order('title DESC') }
  pg_search_scope :search_for, against: %i(title author),
                               using: { tsearch: { prefix: true, dictionary: 'english' } }
end
