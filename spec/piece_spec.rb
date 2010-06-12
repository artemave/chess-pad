require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'piece/factory'
require 'field/dialpad'
require 'piece/base'
require 'piece/pieces/pawn'

describe Piece do
  opts = {
    :field => Field::DialPad.new,
    :start_at => 5
  }
  
  describe Piece::Base do
    describe 'public API' do
      [:move_to, :adjacent_moves, :position].each do |method|
        it "should define #{method}" do
          Piece::Base.method_defined?(method).should be true
        end
      end
    end
  end
  
  describe 'Piece::Base concrete implementation' do
    before do
      @pawn = Piece::Pawn.new(
        :field => Field::DialPad.new,
        :start_at => 5
      )
    end

    opts.keys.each do |param|
      it "should validate the presence of #{param}" do
        lambda {
          Piece::Pawn.new(opts.reject {|k,v| k == param})
        }.should raise_error(RuntimeError, "Couldn't create piece: Invalid :#{param} option: ''")
      end
    end

    it 'should be able to move to another position' do
      lambda { @pawn.move_to(2) }.should_not raise_error
    end

    it 'should not be possible to move piece outside the field'

    it 'should be aware of adjacent possible moves' do
      @pawn.adjacent_moves.should == [2]
    end
  end

  describe Piece::Factory do
    it 'should create valid piece' do
      Piece::Factory.create(opts.merge(:piece => 'pawn')).should be_a_kind_of(Piece::Pawn)
    end

    it 'should validate input' do
      lambda { Piece::Factory.create(opts) }.should raise_error(RuntimeError, "Couldn't create piece: name must be provided")
      lambda { Piece::Factory.create(opts.merge(:piece => 'ball')) }.should raise_error(NameError, "uninitialized constant Piece::Ball")
    end
  end

  describe Piece::Pawn do
    before do
      @pawn = Piece::Factory.create(
        :piece => 'pawn',
        :field => Field::DialPad.new,
        :start_at => 5
      )
    end

    it 'should be able to move one space forward' do
      @pawn.move_to(2).position.should == 2
    end

    it 'should be able to move onto the same position' do
      @pawn.move_to(5).position.should == 5
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
        @pawn.send(:position, 7).move_to(1).position.should == 1

        # starts at first row and first moves one space forward
        @pawn = @pawn.move_to(8)
        lambda { @pawn.move_to(2) }.should raise_error(Piece::InvalidMove, "2 is unreachable for #{@pawn.inspect}")
      end
    end

    it 'should not allow any other moves' do
      [1,3,4,6,7,8,9,'*',0,'#'].each do |pos|
        lambda { @pawn.move_to(pos) }.should raise_error(Piece::InvalidMove, "#{pos} is unreachable for #{@pawn.inspect}")
      end
    end

    it 'should turn into Queen once moved onto the top row' do
      @pawn.should be_a_kind_of(Piece::Pawn)
      @pawn.move_to(2).should be_a_kind_of(Piece::Queen)
    end
  end
end
