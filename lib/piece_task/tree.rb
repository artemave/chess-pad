module PieceTask
  class Tree
    attr_reader :leaves

    def initialize(piece, opts = {})
      @max_depth = opts[:max_depth] || 10
      @current_depth = 0
      @leaves = []
      root_node = Node.new(:tree => self, :value => piece)
      build_next_level(root_node)
    end

    private

    def build_next_level(parent_node, pos = nil)
      no_deeper_than(@max_depth) do
        piece = pos ? parent_node.piece.move_to(pos) : parent_node.piece
        node = pos ? parent_node.add_child_node(piece) : parent_node

        piece.adjacent_moves.each do |p|
          build_next_level(node, p)
        end

        @leaves << node
      end
    end

    def no_deeper_than(depth)
      if @current_depth < depth
        @current_depth+=1
        yield
        @current_depth-=1
      end
    end

    class Node
      attr_reader :value, :parent
      alias :piece :value

      def initialize(args = {})
        @tree = args[:tree]
        @value = args[:value]
        @parent = args[:parent]
      end

      def add_child_node(value)
        Node.new(:tree => @tree, :value => value, :parent => self)
      end

      # TODO spec me
      def parent_nodes
        parent_nodes = []
        node = self
        loop do
          node = node.parent || break
          parent_nodes << node
        end
        parent_nodes
      end
    end
  end
end
