# FlashStyle
#  - interface to the flash message type data
#
class FlashStyle
  attr_reader :css, :icon
  def initialize(css:, icon:)
    @css = css
    @icon = icon
  end
end
