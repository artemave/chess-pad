require 'piece/base'

module Piece
  class Bishop < Base
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
        
        # north west moves
        collect_moves.call(-n, n)
        # north east moves
        collect_moves.call(n, n)
        # south east moves
        collect_moves.call(n, -n)
        # south west moves
        collect_moves.call(-n, -n)

        break if not hit
        n += 1
      end

      adm
    end
  end
end
