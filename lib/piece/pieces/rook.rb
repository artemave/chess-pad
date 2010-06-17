require 'piece/base'

module Piece
  class Rook < Base
    def adjacent_moves
      adm = [@position]

      n = 1
      loop do
        hit = false

        collect_moves = Proc.new {|dx,dy|
          if next_move = @field[:x => @position.x + dx, :y => @position.y + dy]
            adm << next_move
            hit = true
          end
        }
        
        # north moves
        collect_moves.call(0, n)
        # east moves
        collect_moves.call(n, 0)
        # south moves
        collect_moves.call(0, -n)
        # west moves
        collect_moves.call(-n, 0)

        break if not hit
        n += 1
      end

      adm
    end
  end
end
