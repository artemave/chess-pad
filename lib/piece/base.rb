require 'field/base'
require 'field/element'

module Piece
  class Base
    def initialize(args)
      validate_input(args)

      @field = args[:field]
      @position = @field[args[:start_at]]
    end

    attr_reader :position, :field

    def move_to(pos)
      raise 'Not implemented'
    end

    def adjacent_moves
      raise 'Not implemented'
    end

    private

    def validate_move(new_pos)
      unless adjacent_moves.include?(new_pos)
        raise InvalidMove.new(self, new_pos)
      end
    end

    def validate_input(args)
      errors = []
      unless args[:field] and args[:field].kind_of?(Field::Base)
        errors << "Invalid :field option: '#{args[:field]}'"
      end
      unless args[:start_at]
        errors << "Invalid :start_at option: '#{args[:start_at]}'"
      end

      if errors.length > 0
        raise "Couldn't create piece: " + errors.join('; ')
      end
    end

    def position=(pos)
      @position = @field[pos]
    end
  end

  class InvalidMove < Exception
    def initialize(piece, pos)
      super("#{pos} is unreachable for #{piece.inspect}")
    end
  end
end
