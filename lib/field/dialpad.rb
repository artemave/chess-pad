require 'field/base'
require 'field/element'

module Field
  class DialPad < Base

    private

    def init_elements
      @elements.add(:val => '1', :x => 1, :y => 4)
      @elements.add(:val => '2', :x => 2, :y => 4)
      @elements.add(:val => '3', :x => 3, :y => 4)
      @elements.add(:val => '4', :x => 1, :y => 3)
      @elements.add(:val => '5', :x => 2, :y => 3)
      @elements.add(:val => '6', :x => 3, :y => 3)
      @elements.add(:val => '7', :x => 1, :y => 2)
      @elements.add(:val => '8', :x => 2, :y => 2)
      @elements.add(:val => '9', :x => 3, :y => 2)
      @elements.add(:val => '*', :x => 1, :y => 1)
      @elements.add(:val => '0', :x => 2, :y => 1)
      @elements.add(:val => '#', :x => 3, :y => 1)
    end
  end
end
