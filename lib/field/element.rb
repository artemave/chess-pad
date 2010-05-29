module Field
  class Element
    attr_reader :x, :y

    def initialize(args)
      @x, @y = args.values_at(:x, :y)
    end
  end
end
