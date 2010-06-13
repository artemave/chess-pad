require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'piece/factory'
require 'field/dialpad'
require 'piece/pieces/queen'

describe Piece::Queen do
  before do
    @queen = Piece::Factory.create(
      :piece => 'queen',
      :field => Field::DialPad.new,
      :start_at => 8
    )
  end

  it 'should be able to move anywhere (within the field) but 1 and 3' do
    @queen.field.elements.values.each do |e|
      if [1,3].include?(e)
        lambda {@queen.move_to(e)}.should raise_error(Piece::InvalidMove, "#{e} is unreachable for #{@queen.class} at #{@queen.position}")
      else
        @queen.move_to(e).position.should == e
      end
    end
  end

end
