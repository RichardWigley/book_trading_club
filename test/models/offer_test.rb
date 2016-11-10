# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  account_id :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class OfferTest < ActiveSupport::TestCase
  def offer
    @offer ||= Offer.new
  end

  def test_valid
    assert offer.valid?
  end
end
