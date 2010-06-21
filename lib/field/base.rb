require 'forwardable'
require 'field/element'

module Field
  class Base
    attr_reader :elements

    extend Forwardable
    def_delegators :@elements, :[]

    def initialize
      @elements = ElementSet.new
      
      init_elements
    end

    private

    def init_elements
      raise "Not implemented"
    end
  end

  class ElementSet < Hash

    def initialize(*args)
      @lookup_cache = {}
      super
    end

    def [](key)
      if key.is_a?(Hash)
        lookup_element_by_pos(key[:x], key[:y])
      elsif key.kind_of?(Field::Element)
        values.find {|v| v == key} #TODO spec me
      else
        # make digit key work as if it was a string
        # so that field.elements[5] is the same as field.elements['5']
        super(key.to_s)
      end
    end

    def add(args = {})
      [:val, :x, :y].each do |arg|
        raise "#{arg} must be provided" if args[arg].nil?
      end

      if existing_element = lookup_element_by_pos(args[:x], args[:y]) and existing_element.val != args[:val]
        raise "Position already taken by #{existing_element}"
      end

      self[args[:val]] = Field::Element.new(args.merge({:container => self}))
    end

    private

    # so that add() is the only public means of adding new elements
    def []=(*args)
      super
    end

    def lookup_element_by_pos(x, y)
      raise "Coordinates must be provided" unless x and y

      @lookup_cache[[x,y]] ||= values.find {|element| element.x == x and element.y == y}
    end
  end
end
