module Field
  class Element
    attr_reader :val, :x, :y

    def initialize(args)
      @val, @x, @y, @container = args.values_at(:val, :x, :y, :container)
    end

    def neighbours
      neighbours = {}
      neighbours[:n]  = @container[{:x => @x, :y => @y+1}]
      neighbours[:ne] = @container[{:x => @x+1, :y => @y+1}]
      neighbours[:e]  = @container[{:x => @x+1, :y => @y}]
      neighbours[:se] = @container[{:x => @x+1, :y => @y-1}]
      neighbours[:s]  = @container[{:x => @x, :y => @y-1}]
      neighbours[:sw] = @container[{:x => @x-1, :y => @y-1}]
      neighbours[:w]  = @container[{:x => @x-1, :y => @y}]
      neighbours[:nw] = @container[{:x => @x-1, :y => @y+1}]
      neighbours
    end

    def ==(value)
      self.val == value.to_s
    end
  end
end
