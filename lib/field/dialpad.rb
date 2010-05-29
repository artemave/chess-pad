require 'field/base'
require 'field/element'

module Field
  class DialPad < Base

    private

    def init_elements
      @elements['1'] = Element.new(:x => 1, :y => 4)
      @elements['2'] = Element.new(:x => 2, :y => 4)
      @elements['3'] = Element.new(:x => 3, :y => 4)
      @elements['4'] = Element.new(:x => 1, :y => 3)
      @elements['5'] = Element.new(:x => 2, :y => 3)
      @elements['6'] = Element.new(:x => 3, :y => 3)
      @elements['7'] = Element.new(:x => 1, :y => 2)
      @elements['8'] = Element.new(:x => 2, :y => 2)
      @elements['9'] = Element.new(:x => 3, :y => 2)
      @elements['*'] = Element.new(:x => 1, :y => 1)
      @elements['0'] = Element.new(:x => 2, :y => 1)
      @elements['#'] = Element.new(:x => 3, :y => 1)
    end
  end
end
