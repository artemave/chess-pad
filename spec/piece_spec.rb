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

    [:move_to, :next_moves].each do |method|
      it "it should define API method #{method}" do
        Piece::Base.method_defined?(method).should be true
      end
    end
  end
  
  describe 'Piece::Base concrete implementation' do
    opts.keys.each do |param|
      it "should validate the presence of #{param}" do
        lambda {
          Piece::Base.new(opts.reject {|k,v| k == param})
        }.should raise_error
      end
    end
  end

  describe Piece::Factory do
    it 'should create valid piece'

    it 'should complain if piece not found'
  end
end
