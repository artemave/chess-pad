module PieceTask
  class Tree
    def initialize(piece, max_depth)
      @max_depth = max_depth
      @current_depth = 1
      root_node = Node.new(:tree => self, :value => piece)
      build_next_level(root_node)
    end

    private

    def build_next_level(parent_node, pos = nil)
      no_deeper_than(@max_depth) do
        piece = pos ? parent_node.piece.move_to(pos) : parent_node.piece
        node = pos ? parent_node.add_child_node(piece) : parent_node

        piece.next_moves.each do |p|
          build_next_level(node, p)
        end
      end
    end

    def no_deeper_than(depth)
      unless @current_depth > depth
        @current_depth+=1
        yield
        @current_depth-=1
      end
    end

    class Node
      attr_reader :value
      alias :value, :piece

      def initialize(args = {})
        @tree = args[:tree]
        @value = args[:value]
        @parent = args[:parent]
        @children = []
      end

      def add_child_node(value)
        @children << Node.new(:tree => @tree, :value => value, :parent = > self)
      end
    end
  end
end