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
  test "#valid?" do
    contact ||= Contact.new(full_name: 'Bo', address_line_1: '8 Station Road', town: 'London')

    assert contact.valid?
  end

  # validates presence
  #
  [:full_name, :address_line_1, :town].each do |method_name|
    test "##{method_name} is optional outside complete_contact" do
      contact = Contact.new(full_name: 'Bo', address_line_1: '8 Station Rd', town: 'London')

      contact.public_send("#{method_name}=", nil)

      assert contact.valid?
    end

    test "##{method_name} is required for complete_contact" do
      contact = Contact.new(full_name: 'Bo', address_line_1: '8 Station Rd', town: 'London')

      contact.public_send("#{method_name}=", nil)

      refute contact.valid?(:complete_contact)
      assert_includes contact.errors[method_name], "can't be blank",
                      "no validation error for #{method_name} present"
    end
  end

  test "#completed? is true when minimum contact information filled in" do
    contact = Contact.new(full_name: 'Bo', address_line_1: '8 Station Road', town: 'London')

    assert true, contact.completed?
  end

  test "#completed? is false when contact information is missing" do
    contact = Contact.new(full_name: 'Bo', address_line_1: '8 Station Road', town: 'London')

    contact.town = nil

    refute contact.completed?
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
