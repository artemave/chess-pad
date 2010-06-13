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
    @queen.should move_anywhere_but([1,3])
  end
end
