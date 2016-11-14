# == Schema Information
#
# Table name: trades
#
#  id         :integer          not null, primary key
#  offer_id   :integer          not null
#  want_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Trade
#  - when a want matches an offer we get a trade
#
class Trade < ApplicationRecord
  belongs_to :offer
  belongs_to :want
  validates :offer, :want, presence: true
end
