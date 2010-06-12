require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'piece/base'
require 'piece/factory'
require 'field/dialpad'

describe Piece do
  opts = {
    :field => Field::DialPad.new,
    :start_at => 5
  }
  
  describe Piece::Base do
    it 'should be an abstract class' do
      lambda { Piece::Base.new(opts) }.should raise_error(Exception, 'Not implemented')
    end

    describe 'public API' do
      [:move_to, :adjacent_moves].each do |method|
        it "should define #{method}" do
          Piece::Base.method_defined?(method).should be true
        end
      end
    end
  end
  
  describe 'Piece::Base concrete implementation' do
    opts.keys.each do |param|
      it "should validate the presence of #{param}" do
        lambda {
          Piece::Pawn.new(opts.reject {|k,v| k == param})
        }.should raise_error(Exception, "Invalid #{param} option: ''")
      end
    end
  end

  describe Piece::Factory do
    it 'should create valid piece' do
      Piece::Factory.create(opts.merge(:piece => 'pawn')).should be_a_kind_of(Piece::Pawn)
    end

    it 'should validate input' do
      lambda { Piece::Factory.create(opts) }.should raise_error(Exception, 'Piece name must be provided')
      lambda { Piece::Factory.create(opts.merge(:piece => 'ball')) }.should raise_error(NameError, "uninitialized constant Piece::Ball")
    end
  end
end
