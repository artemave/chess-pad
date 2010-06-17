require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'piece/factory'
require 'field/dialpad'

describe Piece::Knight do
  before do
    @bishop = Piece::Factory.create(
      :piece => 'knight',
      :field => Field::DialPad.new,
      :start_at => 8
    )
  end

  it 'should be able to move anywhere (within the field) but 2,4,5,6,7,9,*,0,#' do
    @bishop.should move_anywhere_but([2,4,5,6,7,9,'*',0,'#'])
  end
end

