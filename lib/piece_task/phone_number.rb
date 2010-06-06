require 'piece_task/base'
require 'piece_task/tree'

module PieceTask
  class FindPhoneNumbers < Base

    VALID_PHONE_NUMBER = {
      :length => 10,
      :element => /\d/
    }

    Object.class_eval do
      def valid_phone_number?
        val = self.to_s
        val.length == VALID_PHONE_NUMBER[:length] && val =~ VALID_PHONE_NUMBER[:element]
      end
    end

    def run
      tree = PieceTask::Tree.new(@piece, VALID_PHONE_NUMBER[:length])

      tree.leaves.each do |l|
        number = l.value
        l.parent_nodes.each do |n|
          number = n.value + number # string concatenation, don't get fooled
        end

        @result << number if number.valid_phone_number?
      end

      @result
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
