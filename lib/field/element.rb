module Field
  class Element
    attr_reader :val, :x, :y, :container

    def initialize(args)
      @val, @x, @y, @container = args.values_at(:val, :x, :y, :container)
    end

    def ==(value)
      self.val == value.to_s
    end

    alias :to_s :val
  end
end
