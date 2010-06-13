require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'piece/factory'
require 'field/dialpad'
require 'piece/pieces/pawn'


describe Piece::Pawn do
  before do
    @pawn = Piece::Factory.create(
      :piece => 'pawn',
      :field => Field::DialPad.new,
      :start_at => 8
    )
  end

  it 'should be able to move one space forward' do
    @pawn.move_to(5).position.should == 5
  end

  it 'should be able to move onto the same position' do
    @pawn.move_to(8).position.should == 8
  end

  describe 'when starting on one of the bottom two rows' do
    before do
      @pawn = Piece::Factory.create(
        :piece => 'pawn',
        :field => Field::DialPad.new,
        :start_at => 0
      )
    end

    it 'should be able to move two spaces forward, but only the first time it moves' do

      # starts at first row
      @pawn.move_to(5).position.should == 5

      # starts at second row
      @pawn.send(:position=, 7)
      @pawn.move_to(1).position.should == 1

      # starts at first row and first moves one space forward
      @pawn.send(:position=, 0)
      @pawn = @pawn.move_to(8)
      lambda { @pawn.move_to(2) }.should raise_error(Piece::InvalidMove, "2 is unreachable for #{@pawn.class} at #{@pawn.position}")
    end
  end

  it 'should not allow any other moves' do
    @pawn.send(:position=, 5)
    [1,3,4,6,7,8,9,'*',0,'#','34','g'].each do |pos|
      lambda { @pawn.move_to(pos) }.should raise_error(Piece::InvalidMove, "#{pos} is unreachable for #{@pawn.class} at #{@pawn.position}")
    end
  end

  it 'should turn into Queen once moved onto the top row' do
    @pawn.send(:position=, 5)
    @pawn.should be_a_kind_of(Piece::Pawn)
    @pawn.move_to(2).should be_a_kind_of(Piece::Queen)
  end
end
