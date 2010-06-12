require 'piece/base'
require 'piece/factory'

module Piece
  class Pawn < Base
    def move_to(pos)
      @first_move = @first_move.nil? ? true : false

      new_pos = @field[pos]
      validate_move(new_pos)

      if new_pos.neighbours[:n].nil?
        Piece::Factory.create(
          :piece => 'queen',
          :field => @field,
          :start_at => new_pos
        )
      else
        c = clone
        c.position = new_pos
        c
      end
    end

    def adjacent_moves
      (adm = []) << @position

      adm << @position.neighbours[:n] if @position.neighbours[:n]
      
      if @first_move and [1,2].include?(@position.row) and @field.rows > 3
        adm << @position.neighbours[:n].neighbours[:n]
      end

      adm
    end
  end
end
