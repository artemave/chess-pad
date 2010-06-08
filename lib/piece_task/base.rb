module PieceTask
  class Base
    def initialize(args = {})
      validate(args)

      @piece, field, start_at = args.values_at(:piece, :field, :start_at)

      @piece.position = start_at
      @piece.field = field

      @result = []
    end

    def run!
    end

    private

    def validate(args)
    end
  end
end
