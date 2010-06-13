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

    it 'should be aware of adjacent possible moves' do
      @pawn.adjacent_moves.should == [5,2]
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
end
