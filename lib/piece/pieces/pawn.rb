require 'piece/base'
require 'piece/factory'

module Piece
  class Pawn < Base
    def initialize(*args)
      super
      @first_move = true
    end

    def move_to(pos)
      validate_move(pos)
      new_pos = @field[pos]

      # turn into queen if moving onto the top row
      if @field[:x => new_pos.x, :y => new_pos.y + 1].nil?
        Piece::Factory.create(
          :piece => 'queen',
          :field => @field,
          :start_at => new_pos
        )
      else
        c = clone
        c.position = new_pos
        c.first_move = false
        c
      end
    end

    def adjacent_moves
      adm = [@position]

      if one_space_forward = @field[:x => @position.x, :y => @position.y + 1]
        adm << one_space_forward
      end
      
      if first_move and [1,2].include?(@position.y)
        if two_space_forward = @field[:x => @position.x, :y => @position.y + 2]
          adm << two_space_forward
        end
      end

      adm
    end

    protected

    attr_accessor :first_move

  end
end
