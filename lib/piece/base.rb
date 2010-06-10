require 'field/base'
require 'field/element'

module Piece
  class Base
    def initialize(args)
      raise 'Not implemented'
    end

    attr_reader :next_moves

    def move_to(pos)
      raise 'Not implemented'
    end
  end

  private

  def validate(args)
    errors = []
    unless args[:field] and args[:field].kind_of?(Field::Base)
      errors << "Invalid :field option: '#{args[:field]}'"
    end
    unless args[:start_at] and args[:start_at].kind_of?(Field::Element)
      errors << "Invalid :start_at option: '#{args[:start_at]}'"
    end

    if errors.length > 0
      raise "Couldn't create piece:\n" + errors.join("\n")
    end
  end
end
