require 'piece/base'


module Piece
  class Queen < Base
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
        
        # west moves
        collect_moves.call(-n, 0)
        # north west moves
        collect_moves.call(-n, n)
        # north moves
        collect_moves.call(0, n)
        # north east moves
        collect_moves.call(n, n)
        # east moves
        collect_moves.call(n, 0)
        # south east moves
        collect_moves.call(n, -n)
        # south moves
        collect_moves.call(0, -n)
        # south west moves
        collect_moves.call(-n, -n)

        break if not hit
        n += 1
      end

      adm
    end
  end
end
