# == Schema Information
#
# Table name: contacts
#
#  id             :integer          not null, primary key
#  account_id     :integer
#  address_line_1 :string           not null
#  address_line_2 :string
#  town           :string           not null
#  county         :string
#  postcode       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Contact
#  - contact information for an account
#
class Contact < ApplicationRecord
  belongs_to :account
  validates :address_line_1, presence: true
  validates :town, presence: true
end
