module PieceTask
  class Base
    def initialize(args = {})
      @piece, @field, @start_at = validate(args).values_at(:piece, :field, :start_at)
      init_resultset
    end

    def run
      raise "Not implemented"
    end

    private

    def validate(args)
      args
    end

    def init_resultset
      @result = ResultSet.new
    end
  end

  class ResultSet < Array
  end
end
