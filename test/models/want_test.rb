# == Schema Information
#
# Table name: wants
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class WantTest < ActiveSupport::TestCase
  def want
    @want ||= Want.new
  end

  def test_valid
    assert want.valid?
  end
end
