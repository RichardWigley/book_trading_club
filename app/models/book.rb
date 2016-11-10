# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  author     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Book
#  - represents book information
#
class Book < ApplicationRecord
  has_many :offers
  include PgSearch
  validates :author, :title, presence: true

  scope :ordered, -> { order('title DESC') }
  pg_search_scope :search_for, against: %i(title author),
                               using: { tsearch: { prefix: true, dictionary: 'english' } }
end
