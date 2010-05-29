class Field
  attr_reader :elements

  def initialize
    @elements = {}
    
    # make digit key work as if it was a string
    # so that field.elements[5] is the same as field.elements['5']
    class << @elements
      def [](key)
        super(key.to_s)
      end
    end

    init_elements
  end

  private

  def init_elements
    raise "Not implemented"
  end
end
