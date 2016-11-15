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

require "test_helper"

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact ||= Contact.new(address_line_1: '8 Station Road', town: 'London')
  end

  test "valid" do
    assert @contact.valid?
  end

  test "invalid without first address line" do
    skip('while fixing partial profiles')
    @contact.address_line_1 = nil
    refute @contact.valid?
    assert_includes @contact.errors[:address_line_1], "can't be blank",
                    'Must be invalid when missing address_line_1'
  end

  test "invalid without town" do
    skip('while fixing partial profile')
    @contact.town = nil
    refute @contact.valid?
    assert_includes @contact.errors[:town], "can't be blank",
                    'Must be invalid when missing town'
  end
end
