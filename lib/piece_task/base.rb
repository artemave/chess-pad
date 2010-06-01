require 'piece_task/tree'

module PieceTask
  class Base
    def initialize(args = {})
      @piece, field, start_at = validate(args).values_at(:piece, :field, :start_at)

      @piece.position = start_at
      @piece.field = field

      @tree_depth = 5 # random default

      @result = []
    end

    def run
      tree = Tree.new(@piece, @tree_depth)
    end

    private

    def validate(args)
      args
    end
  end
end
