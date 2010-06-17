require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'piece/factory'
require 'field/dialpad'

describe Piece::King do
  before do
    @bishop = Piece::Factory.create(
      :piece => 'king',
      :field => Field::DialPad.new,
      :start_at => 8
    )
  end

  it 'should be able to move anywhere (within the field) but 1,2,3' do
    @bishop.should move_anywhere_but([1,2,3])
  end
end

