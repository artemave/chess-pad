module Field
  class Base
    attr_reader :elements

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
    # make digit key work as if it was a string
    # so that field.elements[5] is the same as field.elements['5']
    def [](key)
      super(key.to_s)
    end
  end
end
