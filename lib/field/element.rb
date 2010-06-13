module Field
  class Element
    attr_reader :val, :x, :y, :container

    def initialize(args)
      @val, @x, @y, @container = args.values_at(:val, :x, :y, :container)
    end

    def ==(value)
      # TODO spec me
      if value.kind_of?(Field::Element)
        val == value.val && container.equal?(value.container)
      else
        val == value.to_s
      end
    end

    alias :to_s :val
  end
end
