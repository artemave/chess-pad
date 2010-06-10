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

    def run!
      tree = PieceTask::Tree.new(@piece, :max_depth => VALID_PHONE_NUMBER[:length])

      tree.leaves.each do |l|
        number = l.value
        l.parent_nodes.each do |n|
          number = n.value + number # string concatenation! don't get fooled
        end

        @result << number if number.valid_phone_number?
      end

      @result
    end

  end
end
