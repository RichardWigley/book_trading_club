# == Schema Information
#
# Table name: contacts
#
#  id             :integer          not null, primary key
#  account_id     :integer
#  full_name      :string
#  address_line_1 :string
#  address_line_2 :string
#  town           :string
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
  validates :full_name, :address_line_1, :town, presence: true, on: :complete_contact

  def completed?
    valid?(:complete_contact)
  end

  def to_s
    address_lines.join("\n")
  end

  private

  def address_lines
    [full_name, address_line_1, address_line_2, town, county, postcode]
      .reject(&:blank?)
  end
end
