require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'piece/factory'
require 'field/dialpad'

describe Piece::Rook do
  before do
    @bishop = Piece::Factory.create(
      :piece => 'rook',
      :field => Field::DialPad.new,
      :start_at => 8
    )
  end

  it 'should be able to move anywhere (within the field) but 1,4,3,6,*,#' do
    @bishop.should move_anywhere_but([1,4,3,6,'*','#'])
  end
end

