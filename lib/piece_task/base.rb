module PieceTask
  class Base
    def initialize(args = {})
      @piece = Piece::Factory.create(args)
      @result = []
    end

    def run!
    end
  end
end
