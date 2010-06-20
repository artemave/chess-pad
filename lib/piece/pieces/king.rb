require 'piece/base'

module Piece
  class King < Base
    def adjacent_moves
      return @adm if defined?(@adm)

      @adm = [@position]

      [[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]].each do |d|
        if next_move = @field[:x => @position.x + d[0], :y => @position.y + d[1]]
          @adm << next_move
        end
      end

      @adm
    end
  end
end

