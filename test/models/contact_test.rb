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
    @contact ||= Contact.new(full_name: 'Bo', address_line_1: '8 Station Road', town: 'London')
  end

  test "valid" do
    assert @contact.valid?
  end

  test "full name line optional outside complete_contact" do
    @contact.full_name = nil
    assert @contact.valid?
  end

  test "full name required by complete_contact" do
    @contact.full_name = nil

    refute @contact.valid?(:complete_contact)

    assert_includes @contact.errors[:full_name], "can't be blank",
                    'Must be invalid when missing full name'
  end

  test "first address line optional outside complete_contact" do
    @contact.address_line_1 = nil

    assert @contact.valid?
  end

  test "first address line required by complete_contact" do
    @contact.address_line_1 = nil

    refute @contact.valid?(:complete_contact)

    assert_includes @contact.errors[:address_line_1], "can't be blank",
                    'Must be invalid when missing address_line_1'
  end

  test "town optional outside complete_contact" do
    @contact.town = nil

    assert @contact.valid?
  end

  test "town required by complete_contact" do
    @contact.town = nil

    refute @contact.valid?(:complete_contact)
    assert_includes @contact.errors[:town], "can't be blank",
                    'Must be invalid when missing town'
  end

  test "completed? is true when minimum contact information filled in" do
    assert true, @contact.completed?
  end

  test "completed? is false when contact information is missing" do
    @contact.town = nil

    refute @contact.completed?
  end

  test "#to_s returns all lines" do
    contact = Contact.new(full_name: 'Bo',
                          address_line_1: '8 Station Road',
                          address_line_2: 'Wickham',
                          town: 'London',
                          county: 'Kent',
                          postcode: 'BR4 0PU')

    assert_equal contact.to_s, "Bo\n8 Station Road\nWickham\nLondon\nKent\nBR4 0PU"
  end

  test "#to_s skips blank lines" do
    contact = Contact.new(full_name: 'Bo', address_line_1: '8 Station Road', town: 'London')

    assert_equal contact.to_s, "Bo\n8 Station Road\nLondon"
  end
end
