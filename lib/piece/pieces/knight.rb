require 'piece/base'

module Piece
  class Knight < Base
    def adjacent_moves
      adm = [@position]

      [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]].each do |d|
        if next_move = @field[:x => @position.x + d[0], :y => @position.y + d[1]]
          adm << next_move
        end
      end

      adm
    end
  end
end

