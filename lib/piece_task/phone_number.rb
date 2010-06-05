require 'piece_task/base'

module PieceTask
  class FindPhoneNumbers < Base

    VALID_NUMBER = {
      :length => 10,
      :element => /\d/
    }

    def initialize
      super
      @piece.valid_moves = VALID_NUMBER[:element]
      @tree_depth = VALID_NUMBER[:length]
    end

    private

    def validate(args)
      errors = []
      unless args[:piece] and args[:piece].kind_of?(Piece)
        errors << "Invalid :piece option: '#{args[:piece]}'"
      end
      unless args[:field] and args[:field].kind_of?(Field::Base)
        errors << "Invalid :field option: '#{args[:field]}'"
      end
      unless args[:start_at] and args[:start_at].kind_of?(Field::Element)
        errors << "Invalid :start_at option: '#{args[:start_at]}'"
      end

      if errors.length > 0
        raise "Couldn't create task:\n" + errors.join("\n")
      end
    end
  end
end