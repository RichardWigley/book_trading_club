require "test_helper"

class WantTest < ActiveSupport::TestCase
  def want
    @want ||= Want.new
  end

  def test_valid
    assert want.valid?
  end
end
